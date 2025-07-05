# e13.25.46.xdg-desktop-portal-1.20.0.sh
#

#
# Dependencies Required:
#
#           ??? e10.05.04 Fuse-3.16.2           ???
#               e10.25.10 gdk-pixbuf-2.42.12
#               e13.09.29 JSON-Glib-1.10.6
#           ??? e10.42.48 Pipewire-1.2.7        ???
#
# Dependencies Recommended:
#
#               e13.12.07 Bubblewrap-0.11.0
#
# Dependencies Required (at runtime):
#
#               d20.12.11 dbus-1.16.0
#
# Needed at runtime:
#
#               xxx.xx.xx xdg-desktop-portal-{gtk,gnome,lxqt}
#

#
# Required by:
#
#               e41.25.47 xdg-desktop-portal-gtk-1.15.2
#               e42.33.25 xdg-desktop-portal-gnome-47.3
#
# Required (at runtime) by:
#
#               e33.37.34 xdg-desktop-portal-lxqt-1.0.2
#
# Recommended (Runtime):
#
#               e41.09.55 libportal-0.9.1
#
# Opionally by:
#
#               e41.25.28 libadwaita-1.6.4
#

export PKG="xdg-desktop-portal-1.20.0"
export PKGLOG_DIR=$LFSLOG/25.46
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
            -D tests=disabled   \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# No test

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -rvf /usr/lib/systemd    \
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
