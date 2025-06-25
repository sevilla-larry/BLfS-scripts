# e41.42.14.gst-plugins-base-1.26.2.sh
# errata
#

#
# Dependencies Required:
#
#               e41.42.13 gstreamer-1.26.2
#
# Dependencies Recommended:
#
#               e10.42.01 alsa-lib-1.2.13
#               d10.09.17 GLib-2.82.5
#               e10.11.12 ISO Codes-4.17.0
#               e10.09.45 libgudev-238
#               e10.10.18 libjpeg-turbo-3.0.1
#               e10.42.37 libogg-1.3.5
#               d10.10.22 libpng-1.6.46
#               e10.42.44 libvorbis-1.3.7
#               d20.24.12 Mesa-24.3.4
#               e10.25.37 Pango-1.56.1
#               d10.09.98 Wayland-Protocols-1.40
#               d20.24.08 Xorg Libraries
#
# Dependencies Optional:
#
#               e41.25.15 Graphene-1.10.8
#               e11.25.16 GTK-3.24.48
#               e10.42.47 Opus-1.5.2
#               e11.42.52 SDL2-2.30.11
#

#
# Required by:
#
#               e41.42.15 gst-plugins-good-1.26.2   (errata)
#               e41.42.16 gst-plugins-bad-1.26.2    (errata)
#
# Recommended by:
#
#               g22.39.03 LibreOffice-25.2.1    (errata)
#
# Optionally by:
#
#               g42.34.04 Evince-46.3.1
#

export PKG="gst-plugins-base-1.26.2"
export PKGLOG_DIR=$LFSLOG/42.14
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
meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      --wrap-mode=nodownload    \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Tests require X terminal running
#
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
