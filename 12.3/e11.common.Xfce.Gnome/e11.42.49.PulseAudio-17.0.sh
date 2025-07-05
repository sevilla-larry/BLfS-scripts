# e11.42.49.PulseAudio-17.0.sh
# GTK-3.* version
#

#
# Dependencies Required:
#
#               e10.42.40 libsndfile-1.2.2
#
# Dependencies Recommended:
#
#               e10.42.01 alsa-lib-1.2.13
#               d20.12.11 dbus-1.16.0
#               d10.12.12 elogind-255.17
#               d10.09.17 GLib-2.82.5
#               e10.42.55 Speex-1.2.1
#               d20.24.08 Xorg Libraries
#
# Dependencies Optional:
#
#               gst
#               e11.25.16 GTK-3.24.48
#

#
# Required by:
#
#               g22.40.03 Firefox-128.11.0esr       (errata)
#
# Recommended by:
#
#               e41.42.15 gst-plugins-good-1.26.3   (errata)
#               e41.42.48 Pipewire-1.2.7
#
# Optionally by:
#
#               e11.42.52 SDL2-2.30.11
#               e11.44.01 FFmpeg-7.1
#               e41.25.20 gtk-vnc-1.5.0
#

export PKG="pulseaudio-17.0"
export PKGLOG_DIR=$LFSLOG/42.49
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build 
cd    build 

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr       \
            --buildtype=release \
            -D database=gdbm    \
            -D doxygen=false    \
            -D bluez5=disabled  \
            ..                  \
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

# remove the D-Bus configuration file
# for the system wide daemon
# to avoid creating unnecessary
# system users and groups
rm -v /usr/share/dbus-1/system.d/pulseaudio-system.conf \
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
