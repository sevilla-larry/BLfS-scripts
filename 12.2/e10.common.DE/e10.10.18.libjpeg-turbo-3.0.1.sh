# e21.10.18.libjpeg-turbo-3.0.1.sh
#

#
# Dependencies Required:
#
#               b11.13.03 CMake-3.30.2
#
# Dependencies Recommended:
#
#               e21 13.37 yasm-1.3.0
#

#
# Required by:
#
#               e21.25.10 gdk-pixbuf-2.42.12
#               e12.10.20 libmng-2.0.3
#
# Recommended by:
#
#               e12.25.42 Qt-6.7.2
#               e12.10.13 JasPer-4.2.4
#               e12.10.27 libwebp-1.4.0
#
# Optional by:
#
#               e12.10.14 Little CMS-2.1.6
#               e12.10.26 libtiff-4.6.0
#

export PKG="libjpeg-turbo-3.0.1"
export PKGLOG_DIR=$LFSLOG/10.18
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


mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr          \
      -D CMAKE_BUILD_TYPE=RELEASE           \
      -D ENABLE_STATIC=FALSE                \
      -D CMAKE_INSTALL_DEFAULT_LIBDIR=lib   \
      -D CMAKE_SKIP_INSTALL_RPATH=ON        \
      -D CMAKE_INSTALL_DOCDIR=/usr/share/doc/libjpeg-turbo-3.0.1    \
      ..                                    \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
