# d10.11.04.desktop-file-utils-0.28.sh
#

#
# Dependencies Required:
#
#               d10.09.17 GLib-2.82.5
#

#
# Required by:
#
#               e44.34.18 Gucharmap-16.0.2
#
# Recommended by:
#
#               e43.33.35 Nautilus-47.2
#               e43.33.41 Mutter-47.5
#               e43.33.42 gnome-shell-47.4
#               e43.33.47 Yelp-42.3             (errata)
#               e44.34.06 File-Roller-44.5
#               e44.34.08 gnome-color-manager-3.36.2
#               e33.37.40 LXQt Desktop Final Instructions
#
# Runtime needed for test by: ( not implemented )
#
#               d10.09.17 GLib-2.82.5
#
# Optionally by:
#
#               g22.39.03 LibreOffice-25.2.3	(errata)
#               e44.34.15 gnome-system-monitor-47.1
#               e44.34.16 gnome-terminal-3.54.2
#

export PKG="desktop-file-utils-0.28"
export PKGLOG_DIR=$LFSLOG/11.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
