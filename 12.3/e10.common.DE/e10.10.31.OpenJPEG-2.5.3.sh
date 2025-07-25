# e10.10.31.OpenJPEG-2.5.3.sh
#

#
# Dependencies Required:
#
#               a.08.9x.?1 CMake-3.31.5
#
# Dependencies Optional:
#
#               a.08.93.05 Git-2.48.1
#               e10.10.14  Little CMS-2.17
#               d10.10.22  libpng-1.6.46
#               e10.10.26  libtiff-4.7.0
#

#
# Required by:
#
#               g42.34.04 Evince-46.3.1
#               e44.34.04 Evince-46.3.1
#               e41.25.45 WebKitGTK-2.46.6
#
# Recommended by:
#
#               e11.10.33 Poppler-25.02.0
#
# Optionally by:
#
#               e10.44.01 FFmpeg-7.1
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
#

export PKG="openjpeg-2.5.3"
export PKGLOG_DIR=$LFSLOG/10.31
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
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
 

mkdir    build
cd       build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_BUILD_TYPE=Release   \
      -D CMAKE_INSTALL_PREFIX=/usr  \
      -D BUILD_STATIC_LIBS=OFF      \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR 
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

#complex testing

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -rv ../doc/man -T /usr/share/man \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
