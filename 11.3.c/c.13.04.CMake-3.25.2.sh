# c.13.04.CMake-3.25.2.sh
#
# Required by:
#
#   10.17 libjpeg-turbo-3.0.0
#   10.10 Graphite2-1.3.14
#
#
# Dependencies Recommended but needed:
#
#   17.02 cURL-7.88.1
#
# Dependencies Recommended:
#
#   09.28 libarchive-3.6.2
#   09.65 libuv-1.44.2
#   17.20 nghttp2-1.52.0
#

export PKG="cmake-3.25.2"
export PKGLOG_DIR=$LFSLOG/13.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./bootstrap --prefix=/usr        \
            --system-libs        \
            --mandir=/share/man  \
            --no-system-jsoncpp  \
            --no-system-librhash \
            --no-system-{curl,libarchive,libuv,nghttp2} \
            --docdir=/share/doc/cmake-3.25.2            \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
LC_ALL=en_US.UTF-8 \
    bin/ctest $MAKEFLAGS    \
    -O  $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
