# e10.10.27.libwebp-1.5.0.sh
# Xfce LXQt Gnome KDE
#

#
# Dependencies Recommended:
#
#               e10.10.18 libjpeg-turbo-3.0.1
#               d10.10.22 libpng-1.6.46
#               e10.10.26 libtiff-4.7.0
#               e10.42.52 SDL2-2.30.11
#
# Dependencies Optional:
#
#               e10.10.08  giflib-5.2.2
#

#
# Required by:
#
#               e41.10.38 webp-pixbuf-loader-0.2.7
#               e41.25.45 WebKitGTK-2.48.3      (errata)
#
# Recommended by:
#
#               g22.40.03 Firefox-140.1.0esr    (errata)
#               g22.39.03 LibreOffice-25.2.3	(errata)
#               e12.25.40 Qt-6.9.1          (errata/svn)
#
# Optionally by:
#
#               e10.10.19 libjxl-0.11.1
#               e10.44.01 FFmpeg-7.1
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
#

export PKG="libwebp-1.5.0"
export PKGLOG_DIR=$LFSLOG/10.27
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
 

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --enable-libwebpmux     \
            --enable-libwebpdemux   \
            --enable-libwebpdecoder \
            --enable-libwebpextras  \
            --enable-swap-16bit-csp \
            --disable-static        \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
