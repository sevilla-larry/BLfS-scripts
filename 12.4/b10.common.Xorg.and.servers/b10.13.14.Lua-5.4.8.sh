# b10.13.14.Lua-5.4.8.sh
#

#
# Recommended by:
#
#               b10.16.05 Nmap-7.98
#               e13.42.58 Wireplumber-0.5.8
#
# Optionally by:
#
#               c13.20.01 Apache-2.4.65
#

export PKG="lua-5.4.8"
export PKGLOG_DIR=$LFSLOG/13.14
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


cat > lua.pc << "EOF"   2>> $PKGLOG_ERROR
V=5.4
R=5.4.8

prefix=/usr
INSTALL_BIN=${prefix}/bin
INSTALL_INC=${prefix}/include
INSTALL_LIB=${prefix}/lib
INSTALL_MAN=${prefix}/share/man/man1
INSTALL_LMOD=${prefix}/share/lua/${V}
INSTALL_CMOD=${prefix}/lib/lua/${V}
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires:
Libs: -L${libdir} -llua -lm -ldl
Cflags: -I${includedir}
EOF

patch -Np1 -i ../lua-5.4.8-shared_library-1.patch   \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make linux  > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Test ..."
echo "3. Make Test ..." >> $LFSLOG_PROCESS
echo "3. Make Test ..." >> $PKGLOG_ERROR
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make INSTALL_TOP=/usr                   \
     INSTALL_DATA="cp -d"               \
     INSTALL_MAN=/usr/share/man/man1    \
     TO_LIB="liblua.so liblua.so.5.4 liblua.so.5.4.8"   \
     install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

#mkdir -pv                           \
#        /usr/share/doc/lua-5.4.8    \
#            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
#cp -v doc/*.{html,css,gif,png}      \
#        /usr/share/doc/lua-5.4.8    \
#            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -v -m644 -D lua.pc /usr/lib/pkgconfig/lua.pc    \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "5. Basic tests ..."
echo "5. Basic tests ..." >> $LFSLOG_PROCESS
echo "5. Basic tests ..." >> $PKGLOG_ERROR
tar xvf ../$PKG-tests.tar.gz >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

cd $PKG-tests
lua -e "_U=true" all.lua    \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
