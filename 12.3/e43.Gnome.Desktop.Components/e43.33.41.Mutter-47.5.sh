# e43.33.41.Mutter-47.5.sh
#

#
# Dependencies Required:
#
#                   e43.33.38 gnome-settings-daemon-47.2
#                   xxx.xx.xx graphene-1.10.8
#                   xxx.xx.xx libei-1.3.0
#                   xxx.xx.xx libxcvt-0.1.3
#                   xxx.xx.xx libxkbcommon-1.8.0
#                   xxx.xx.xx pipewire-1.2.7

# Dependencies Recommended:
#
#                   xxx.xx.xx desktop-file-utils-0.28
#                   d10.09.17 GLib-2.82.5
#                   xxx.xx.xx libdisplay-info-0.2.0
#                   xxx.xx.xx startup-notification-0.12
#
# Required by:
#
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
meson setup --prefix=/usr        \
            --buildtype=release  \
             -D tests=disabled   \
             -D profiler=false   \
            ..                   \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
