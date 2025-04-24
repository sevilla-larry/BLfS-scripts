# e43.33.44.gnome-session-47.0.1.sh
#

#
# Dependencies Required:
#
#                   xxx.xx.xx elogind-255.17
#                   xxx.xx.xx gnome-desktop-44.1
#                   xxx.xx.xx JSON-GLib-1.10.6
#                   xxx.xx.xx Mesa-24.3.4
#                   xxx.xx.xx UPower-1.90.7

#
# Required by:
#
#

export PKG="gnome-session-47.0.1"
export PKGLOG_DIR=$LFSLOG/33.44
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG

sed 's@/bin/sh@/bin/sh -l@' -i gnome-session/gnome-session.in

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr                    \
            --buildtype=release              \
            -D systemduserunitdir=/tmp       \
            ..                               \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mv -v /usr/share/doc/gnome-session{,-47.0.1}

rm -v /usr/share/xsessions/gnome.desktop &&
rm -v /usr/share/wayland-sessions/gnome.desktop


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
