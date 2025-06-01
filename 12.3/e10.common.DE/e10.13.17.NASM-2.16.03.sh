# e10.13.17.NASM-2.16.03.sh
#

#
# Dependencies Optional:
#
#               d10.49.06 xmlto-0.0.29
#

#
# Recommended by:
#
#               g11.42.45 libvpx-1.15.0
#               g22.40.03 Firefox-128.7.0esr
#
# Optionally by:
#
#               g11.42.52 SDL2-2.30.11
#               g12.39.03 LibreOffice-25.2.1    ???
#

export PKG="nasm-2.16.03"
export PKGLOG_DIR=$LFSLOG/13.17
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


tar -vxf ../nasm-2.16.03-xdoc.tar.xz --strip-components=1    \
            >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m755 -d      /usr/share/doc/nasm-2.16.03/html   \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v doc/html/*.html    /usr/share/doc/nasm-2.16.03/html   \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v doc/*.{txt,ps,pdf} /usr/share/doc/nasm-2.16.03        \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
