# e10.12.37.UPower-1.90.7.sh
#

#
# Dependencies Required:
#
#               e10.09.45 libgudev-238
#               e10.09.69 libusb-1.0.27
#
# Dependencies Optional:
#
#               d10.09.17  GLib-2.82.5
#               a.08.91.38 libxslt-1.1.43
#

#
# Required by:
#
#               e23.35.14 xfce4-power-manager-4.20.0
#               e41.12.27 Power-profiles-daemon-0.30
#				e43.33.38 gnome-settings-daemon-47.2
#               e43.33.44 gnome-session-47.0.1
#               e44.34.13 gnome-power-manager-43.0
#               e33.37.25 lxqt-powermanagement-2.1.0
#
# Recommended by:
#
#               e42.33.23 localsearch-3.8.2
#
# Optionally by:
#
#               e23.35.15 xfce4-settings-4.20.1
#

export PKG="upower-v1.90.7"
export PKGLOG_DIR=$LFSLOG/12.37
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
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                   \
      --prefix=/usr              \
      --buildtype=release        \
      -D gtk-doc=false           \
      -D man=false               \
      -D systemdsystemunitdir=no \
      -D udevrulesdir=/usr/lib/udev/rules.d \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# test suite should be run from a local GUI

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
