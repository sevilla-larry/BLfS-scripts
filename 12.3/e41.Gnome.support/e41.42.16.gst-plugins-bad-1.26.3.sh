# e41.42.16.gst-plugins-bad-1.26.3.sh
# errata
#

#
# Dependencies Required:
#
#               e41.42.15 gst-plugins-base-1.26.3   (errata)
#
# Dependencies Recommended:
#
#               d20.42.41 libva-2.22.0      PC
#               e41.42.54 SoundTouch-2.3.3
#
# Dependencies Optional:
#
#               a.08.93.04 cURL-8.14.1
#               e11.25.16  GTK+-3.24.48
#               e41.42.16  gst-plugins-good-1.26.3  (errata)
#               e13.09.29  JSON-Glib-1.10.6
#               e10.10.14  LittleCMS-2.17
#               e10.10.16  libexif-0.6.25
#               e11.10.24  librsvg-2.59.2
#               e10.42.40  libsndfile-1.2.2
#               a.08.91.68 libssh2-1.11.1
#               e10.09.69  libusb-1.0.27
#               e10.10.27  libwebp-1.5.0
#               e10.09.71  libxkbcommon-1.8.0
#               a.08.91.08 libxml2-2.14.3   (errata)
#               a.08.91.10 Nettle-3.10.1
#           or  a.08.91.35 libgcrypt-1.11.0
#               e10.10.31  OpenJPEG-2.5.3
#               e10.42.47  Opus-1.5.2
#               e10.25.37  Pango-1.56.1
#               d20.25.44  Vulkan-Loader-1.4.304        (PCs)
#           and e41.11.06  glslc from shaderc-2024.4    (PCs)
#               d10.09.97  Wayland-1.23.0
#

#
# Required by:
#
#               e41.25.45 WebKitGTK-2.46.6
#
# Recommended ( but needed by ):
#
#               e11.25.18 GTK-4.14.5
#

export PKG="gst-plugins-bad-1.26.3"
export PKGLOG_DIR=$LFSLOG/42.16
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
      -D gpl=enabled        \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Several tests need a terminal emulator
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
