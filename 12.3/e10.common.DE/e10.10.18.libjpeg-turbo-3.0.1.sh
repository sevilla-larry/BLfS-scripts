# e10.10.18.libjpeg-turbo-3.0.1.sh
#

#
# Dependencies Required:
#
#               a.08.9x.?1.CMake-3.31.5
#
# Dependencies Recommended:
#
#               e10.13.17 NASM-2.16.03
#            or e10.13.38 yasm-1.3.0
#

#
# Required by:
#
#               e10.25.10 gdk-pixbuf-2.42.12
#               e41.10.17 libgxps-0.3.2
#               e10.10.19 libjxl-0.11.1
#               e12.10.20 libmng-2.0.3
#               e44.34.03 EOG-47.0
#
# Recommended by:
#
#               e11.10.33 Poppler-25.02.0
#               e10.10.27 libwebp-1.5.0
#               g22.39.03 LibreOffice-25.2.3	    (errata)
#               e41.42.15 gst-plugins-base-1.26.3   (errata)
#               e41.42.57 v4l-utils-1.28.1
#               e12.25.40 Qt-6.9.1              (errata/svn)
#               e12.10.13 jasper-4.2.4
#
# Optionally by:
#
#               e23.35.12 tumbler-4.20.0
#               e10.10.14 Little CMS-2.17
#               e10.10.26 libtiff-4.7.0
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


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
