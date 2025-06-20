# e43.33.38.gnome-settings-daemon-47.2.sh
#

#
# Dependencies Required:
#
#               e10.42.01 alsa-lib-1.2.13
#               d10.10.05 Fontconfig-2.16.0
#               e42.33.02 Gcr-4.3.1
#               xxx.xx.xx GeoClue-2.7.2
#               e42.33.09 geocode-glib-3.26.4
#               e42.33.12 gnome-desktop-44.1
#               e11.42.26 libcanberra-0.30
#               e42.33.18 libgweather-4.4.4
#               e11.25.32 libnotify-0.8.4
#           ??? xxx.xx.xx libwacom-2.14.0
#               e11.42.49 PulseAudio-17.0 (GTK)
#               e10.12.37 UPower-1.90.7
#
# Dependencies Recommended:
#
#               xxx.xx.xx  colord-1.4.7
#           ??? xxx.xx.xx  Cups-2.4.11
#               xxx.xx.xx  NetworkManager-1.50.0
#               a.08.91.32 nss-3.108
#               d10.09.97  Wayland-1.23.0
#
# Dependencies Recommended (Runtime):
#
#               xxx.xx.xx blocaled-0.7
#
# Dependencies Optional:
#
#               xxx.xx.xx gnome-session-47.0.1
#               Xvfb from
#                   d20.24.20 Xorg-Server-21.1.16
#                or
#                   d20.24.19 Xwayland-24.1.6
#

#
# Required by:
#
#

export PKG="gnome-settings-daemon-47.2"
export PKGLOG_DIR=$LFSLOG/33.38
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


sed -e 's/libsystemd/libelogind/'           \
    -i plugins/power/test.py                \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -e 's/(backlight->logind_proxy)/(0)/'   \
    -i plugins/power/gsd-backlight.c        \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr       \
            --buildtype=release \
            -D systemd=false    \
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


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
