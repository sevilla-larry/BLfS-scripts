# b10.09.72.libxml2-2.13.6.sh
#

#
# Dependencies Recommended:
#
#               b10.09.24 icu-75.1
#

#
# Required by:
#
#               d10.09.74 libxslt-1.1.42
#               d10.09.97 Wayland-1.23.0
#               d10.11.16 shared-mime-info-2.4
#
# Recommended by:
#
#               ???.37.07 LXPanel-0.10.1        ???
#               g12.39.03 LibreOffice-24.8.0
#
# Required to run tests by:
#
#               d20.24.06 xcb-proto-1.17.0
#
# Optional by:
#
#               c11.22.03 MariaDB-10.11.8
#               c12.22.04 PostgreSQL-16.4
#               c13.20.01 Apache-2.4.62
#               d10.10.05 Fontconfig-2.15.0
#               d10.13.12 LLVM-18.1.7
#

export PKG="libxml2-2.13.6"
export PKGLOG_DIR=$LFSLOG/09.72
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "   Patching ..."
echo "   Patching ..." >> $LFSLOG_PROCESS
echo "   Patching ..." >> $PKGLOG_ERROR
patch -Np1 -i ../libxml2-2.13.3-upstream_fix-2.patch    \
        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --sysconfdir=/etc       \
            --disable-static        \
            --with-history          \
            --with-icu              \
            PYTHON=/usr/bin/python3 \
            --docdir=/usr/share/doc/libxml2-2.13.3 \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

tar xvf ../xmlts20130923.tar.gz >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -vf /usr/lib/libxml2.la                              \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed '/libs=/s/xml2.*/xml2"/' -i /usr/bin/xml2-config    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
