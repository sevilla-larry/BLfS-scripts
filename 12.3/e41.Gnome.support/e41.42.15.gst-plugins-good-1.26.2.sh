# e41.42.15.gst-plugins-good-1.26.2.sh
# errata
#

#
# Dependencies Required:
#
#               e41.42.14 gst-plugins-base-1.26.2   (errata)
#
# Dependencies Recommended:
#
#               e10.25.04 Cairo-1.18.2
#               e10.42.11 FLAC-1.4.3
#               e10.25.10 gdk-pixbuf-2.42.12
#               e10.43.04 LAME-3.100
#               e41.17.18 libsoup-3.6.5 (errata)
#               e11.42.45 libvpx-1.15.2
#               e10.43.05 mpg123-1.32.10
#               e10.13.17 NASM-2.16.03
#               e11.42.49 PulseAudio-17.0
#
# Dependencies Optional:
#
#               e11.25.16 GTK-3.24.48
#                           Qt-6.x
#               e10.42.55 Speex-1.2.1
#               d10.09.97 Wayland-1.23.0
#

#
# Recommended Runtime by:
#
#               e11.25.17 GTK-4.16.12
#

export PKG="gst-plugins-good-1.26.2"
export PKGLOG_DIR=$LFSLOG/42.15
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build 
cd    build 

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..              \
      --prefix=/usr         \
      --buildtype=release   \
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
