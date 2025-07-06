# e43.33.41.Mutter-47.5.sh
#

#
# Dependencies Required:
#
#               e43.33.38 gnome-settings-daemon-47.2
#               e41.25.15 graphene-1.10.8
#               e41.25.29 libei-1.3.0
#               d20.24.09 libxcvt-0.1.3
#               e10.09.71 libxkbcommon-1.8.0
#               e41.42.48 Pipewire-1.2.7
#
# Dependencies Recommended:
#
#               d10.11.04 desktop-file-utils-0.28
#               d10.09.17 GLib-2.82.5
#               e11.09.41 libdisplay-info-0.2.0
#               e11.25.42 startup-notification-0.12
#
# Dependencies Recommended (Required for Wayland):
#
#               d20.24.21.3 libinput-1.27.1
#               d10.09.97   Wayland-1.23.0
#               d10.09.98   Wayland-Protocols-1.40
#               d20.24.19   Xwayland-24.1.8         (errata)
#
# Dependencies Optional:
#
#               Xvfb from
#                   d20.24.20 Xorg-Server-21.1.18   (errata)
#                or d20.24.19 Xwayland-24.1.8       (errata)
#

#
# Required by:
#
#               e43.33.42 gnome-shell-47.4
#

export PKG="mutter-47.5"
export PKGLOG_DIR=$LFSLOG/33.41
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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
meson setup --prefix=/usr       \
            --buildtype=release \
            -D tests=disabled   \
            -D profiler=false   \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Tests require an active X or wayland session

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
