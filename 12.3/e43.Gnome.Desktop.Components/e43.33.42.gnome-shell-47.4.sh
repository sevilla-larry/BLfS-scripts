# e43.33.42.gnome-shell-47.4.sh
#

#
# Dependencies Required:
#
#               e42.33.21 evolution-data-server-3.54.3
#               e42.33.02 Gcr-4.3.1
#               e42.33.10 Gjs-1.82.1
#               e42.33.12 gnome-desktop-44.1
#               d41.11.10 ibus-1.5.31
#               e43.33.41 Mutter-47.5
#               d10.04.20 Polkit-126
#               e11.25.42 startup-notification-0.12
#
# Dependencies Recommended:
#
#               d10.11.04 desktop-file-utils-0.28
#               e42.33.11 gnome-autoar-0.4.5
#           ??? e43.33.36 gnome-bluetooth-47.1
#               e41.42.14 gst-plugins-base-1.26.3   (errata)
#           ??? xxx.16.03 NetworkManager-1.50.0
#               e41.12.27 power-profiles-daemon-0.30
#
# Dependencies Required (Runtime):
#
#               e41.28.01 adwaita-icon-theme-47.0
#               e43.33.31 DConf-0.40.0
#               d10.12.12 elogind-255.17
#                f1.26.01 GDM-47.0
#               e43.33.40 gnome-control-center-47.4
#               e42.33.18 libgweather-4.4.4
#
# Dependencies Recommended (Runtime):
#
#               e41.12.13 blocaled-0.7
#               e42.33.13 gnome-menus-3.36.0
#

#
# Optionally (Runtime) by:
#
#               e43.33.40 gnome-control-center-47.4
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
meson setup --prefix=/usr       \
            --buildtype=release \
            -D systemd=false    \
            -D tests=false      \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Tests, ensure Mutter is installed after running its test suite

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
