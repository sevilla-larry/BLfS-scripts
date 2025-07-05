# e43.33.40.gnome-control-center-47.4.sh
#

#
# Dependencies Required:
#
#               e42.33.14 AccountsService-23.13.9                 
#               e41.25.07 colord-gtk-0.3.1
#               xxx.xx.xx Cups-2.4.11
#             ? e43.33.36 gnome-bluetooth-47.1
#               e42.33.14 gnome-online-accounts-3.52.3.1
#               e43.33.38 gnome-settings-daemon-47.2
#               e42.33.24 gsound-1.0.3
#               xxx.xx.xx libadwaita-1.6.4
#               e42.33.17 libgtop-2.41.3
#               xxx.xx.xx libnma-1.10.6
#               xxx.xx.xx libpwquality-1.4.5
#             ? xxx.xx.xx MIT KerberosV5-1.21.3
#             ? xxx.xx.xx ModemManager-1.18.12
#             ? xxx.xx.xx Samba-4.21.4
#               d10.11.16 shared-mine-info-2.4
#               e43.33.39 Tecla-47.0
#               xxx.xx.xx UDisks-2.10.1
#
# Dependencies Recommended:
#
#               xxx.xx.xx ibus-1.5.31
#
# Dependencies Recommended (Runtime):
#
#               xxx.xx.xx blocaled-0.7
#
# Dependencies Optional:
#
#               Xvfb from
#                   d20.24.20 Xorg-Server-21.1.16
#                or
#                   d20.24.19 Xwayland-24.1.6
#
# Dependencies Optional (Runtime):
#
#                           gnome-color-manager-3.36.2
#                           gnome-shell-47.4
#               e11.42.53 sound-theme-freedesktop-0.8
#

#
# Required by:
#
#

export PKG="gnome-control-center-47.4"
export PKGLOG_DIR=$LFSLOG/33.40
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
meson setup --prefix=/usr       \
            --buildtype=release \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
GTK_A11Y=none ninja test    \
            > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

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
