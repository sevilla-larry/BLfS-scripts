# e41.42.48.Pipewire-1.2.7.sh
#

#
# Dependencies Recommended:
#
#           ??? e41.12.06 BlueZ-5.79
#               d20.12.11 dbus-1.16.0
#               e41.42.13 gstreamer-1.26.3          (errata)
#               e41.42.14 gst-plugins-base-1.26.3   (errata)
#               e10.42.49 PulseAudio-17.0
#           ??? e41.42.50 SBC-2.0
#               e41.42.57 v4l-utils-1.28.1
#
# Dependencies Recommended (runtime):
#
#               e41.42.58 Wireplumber-0.5.8
#
# Dependencies Optional:
#
#               e10.42.01 alsa-lib-1.2.13
#               e41.16.01 Avahi-0.8
#               e10.44.01 FFmpeg-7.1
#               e11.42.26 libcanberra-0.30
#               d20.25.33 Libdrm-2.4.124
#               d20.24.07 libxcb-1.17.0
#               e10.42.40 libsndfile-1.2.2
#               e10.09.69 libusb-1.0.27
#               e10.42.47 Opus-1.5.2
#               e10.42.52 SDL2-2.30.11
#               d20.25.44 Vulkan-Loader-1.4.304
#               d20.24.08 Xorg Libraries
#               

#
# Required by:
#
#               e43.33.41 Mutter-47.5
#               e41.42.58 Wireplumber-0.5.8
#

export PKG="pipewire-1.2.7"
export PKGLOG_DIR=$LFSLOG/42.48
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

if [ "$COMPUTER_TYPE" = "PC" ]; then
     export VULKAN_FLAG=enabled
else
     export VULKAN_FLAG=disabled
fi

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr               \
            --buildtype=release         \
            -D session-managers="[]"    \
            -D ffmpeg=enabled           \
            -D vulkan=$VULKAN_FLAG      \
            ..                          \
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
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
