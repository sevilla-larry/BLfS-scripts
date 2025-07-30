# e10.10.19.libjxl-0.11.1.sh
#

#
# Dependencies Required:
#
#               a.08.91.22.brotli-1.1.0
#               a.08.9x.?1 CMake-3.31.5
#               e10.10.08  giflib-5.2.2
#               e10.09.24  highway-1.2.0
#               e10.10.14  LittleCMS-2.17
#               e10.10.18  libjpeg-turbo-3.0.1
#               d10.10.22  libpng-1.6.46
#               
# Dependencies Recommended:
#
#               e10.25.10 gdk-pixbuf-2.42.12
#
# Dependencies Optional:
#
#               e10.10.15 libavif-1.2.0
#               e10.10.27 libwebp-1.5.0
#               e10.44.01 FFmpeg-7.1
#

#
# Required by:
#
#               e43.33.32 gnome-backgrounds-47.0
#
# Recommended by:
#
#               e41.25.45 WebKitGTK-2.48.3          (errata)
#

export PKG="libjxl-0.11.1"
export PKGLOG_DIR=$LFSLOG/10.19
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
      -D BUILD_TESTING=OFF                     \
      -D BUILD_SHARED_LIBS=ON                  \
      -D JPEGXL_ENABLE_SKCMS=OFF               \
      -D JPEGXL_ENABLE_SJPEG=OFF               \
      -D JPEGXL_ENABLE_PLUGINS=ON              \
      -D JPEGXL_INSTALL_JARDIR=/usr/share/java \
      -G Ninja                      \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

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
