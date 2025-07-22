# e10.10.15.libavif-1.2.0.sh
#

#
# Dependencies Required:
#
#               e10.42.24 libaom-3.12.0
#
# Dependencies Recommended:
#
#               e10.25.10 gdk-pixbuf-2.42.12
#
# Dependencies Optional:
#
#               a.08.91.40 make-ca-1.16
#

#
#
# Recommended by:
#
#               e41.25.45 WebKitGTK-2.46.6
#
# Optionally by:
#
#               e10.10.19.libjxl-0.11.1
#

export PKG="libavif-1.2.0"
export PKGLOG_DIR=$LFSLOG/10.15
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D CMAKE_BUILD_TYPE=Release   \
      -D AVIF_CODEC_AOM=SYSTEM      \
      -D AVIF_BUILD_GDK_PIXBUF=ON   \
      -D AVIF_LIBYUV=OFF            \
      -G Ninja                      \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. CMake Configure Test ..."
echo "4. CMake Configure Test ..." >> $LFSLOG_PROCESS
echo "4. CMake Configure Test ..." >> $PKGLOG_ERROR
cmake -D AVIF_GTEST=LOCAL       \
      -D AVIF_BUILD_TESTS=ON    \
      ..                        \
      >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "5. Ninja Build Test ..."
echo "5. Ninja Build Test ..." >> $LFSLOG_PROCESS
echo "5. Ninja Build Test ..." >> $PKGLOG_ERROR
ninja >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

gdk-pixbuf-query-loaders --update-cache     \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
