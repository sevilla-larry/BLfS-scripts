# e43.33.44.gnome-session-47.0.1.sh
#

#
# Dependencies Required:
#
#               d10.12.12 elogind-255.17
#               e42.33.12 gnome-desktop-44.1
#               e13.09.29 JSON-GLib-1.10.6
#               d20.24.12 Mesa-24.3.4
#               e10.12.37 UPower-1.90.7
#
#
# Dependencies Optional:
#
#               d10.49.06  xmlto-0.0.29
#               a.08.91.38 libxslt-1.1.43 (errata)
#               a.08.91.36 docbook-xml-4.5
#               a.08.91.37 docbook-xsl-nons-1.79.2
#

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


sed 's@/bin/sh@/bin/sh -l@'             \
    -i gnome-session/gnome-session.in   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr               \
            --buildtype=release         \
            -D systemduserunitdir=/tmp  \
            ..                          \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mv -v /usr/share/doc/gnome-session{,-47.0.1}    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

rm -v /usr/share/xsessions/gnome.desktop        \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
rm -v /usr/share/wayland-sessions/gnome.desktop \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

rm -rv /tmp/{*.d,*.target,*.service}            \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -e 's@^Exec=@&/usr/bin/dbus-run-session @'              \
    -i /usr/share/wayland-sessions/gnome-wayland.desktop    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
