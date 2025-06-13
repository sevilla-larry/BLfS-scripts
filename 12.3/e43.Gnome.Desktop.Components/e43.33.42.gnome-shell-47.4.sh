# e43.33.42.gnome-shell-47.4.sh
#

#
# Dependencies Required:
#
#                   xxx.xx.xx Gcr-4.3.1
#                   xxx.xx.xx evolution-data-server-3.54.3
#                   xxx.xx.xx Gjs-1.82.1
#                   xxx.xx.xx gnome-desktop-44.1
#                   xxx.xx.xx ibus-1.5.31
#                   e43.33.41 Mutter-47.5
#                   xxx.xx.xx Polkit-126
#                   xxx.xx.xx startup-notification-0.12

# Dependencies Recommended:
#
#                   xxx.xx.xx desktop-file-utils-0.28
#                   e42.33.11.gnome-autoar-0.4.5
#                   e43.33.36.gnome-bluetooth-47.1
#                   xxx.xx.xx gst-plugins-base-1.24.12
#                   xxx.xx.xx NetworkManager-1.50.0
#                   xxx.xx.xx power-profiles-daemon-0.30
#
# Required by:
#
#

export PKG="gnome-shell-47.4"
export PKGLOG_DIR=$LFSLOG/33.42
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
meson setup --prefix=/usr        \
            --buildtype=release  \
             -D systemd=false    \
             -D tests=false      \
            ..                   \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

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
