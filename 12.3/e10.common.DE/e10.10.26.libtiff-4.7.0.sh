# e10.10.26.libtiff-4.7.0.sh
#

#
# Dependencies Recommended (required):
#
#               a.08.9x.?1 CMake-3.31.5
#
# Dependencies Optional:
#
#               e10.10.18 libjpeg-turbo-3.0.1
#           ??? e10.10.27 libwebp-1.4.0 (circular)
#

#
# Recommended by:
#
#               e10.25.10 gdk-pixbuf-2.42.12
#               e11.10.33 Poppler-25.02.0
#               e12.25.42 Qt-6.7.2                  ???
#               g12.39.03 LibreOffice-24.8.0        ???
#
# Optionally by:
#
#               e10.10.14 Little CMS-2.17
#               e10.10.31 OpenJPEG-2.5.3
#               g22.34.04 Evince-46.3.1
#

export PKG="tiff-4.7.0"
export PKGLOG_DIR=$LFSLOG/10.26
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
 

mkdir -p libtiff-build
cd       libtiff-build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_DOCDIR=/usr/share/doc/libtiff-4.7.0  \
      -D CMAKE_INSTALL_PREFIX=/usr                          \
      -G Ninja                                              \
      ..                                                    \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
