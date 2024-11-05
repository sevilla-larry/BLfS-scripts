# e11.25.18.GTK-4.14.5.sh
#

#
# Dependencies Required:
#
#               e10.10.06 FriBidi-1.0.15
#               e10.25.10 gdk-pixbuf-2.42.12
#               e11.25.16 Graphene-1.10.8
#               e11.11.11 ISO Codes-4.16.0
#               d20.25.35 libepoxy-1.5.10
#               e10.09.71 libxkbcommon-1.7.0
#               e10.25.38 Pango-1.54.0
#               e11.13.23.23 PyGObject-3.48.2
#               d10.09.98 Wayland-Protocols-1.36
#
# Dependencies Recommended:
#
#               e21.28.01 adwaita-icon-theme-46.2   (runtime)
#               e10.28.07 hicolor-icon-theme-0.18   (test)
#               e11.10.24 librsvg-2.58.3 ???
#
# Dependencies Recommended ( Required if building Gnome ):
#
#               d10.09.17 GLib-2.80.4
#

#
# Required by:
#
#               e11.33.07 VTE-0.76.4
#

export PKG="gtk-4.14.5"
export PKGLOG_DIR=$LFSLOG/25.18
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

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
meson setup --prefix=/usr               \
            --buildtype=release         \
            -D broadway-backend=true    \
            -D introspection=enabled    \
            -D vulkan=disabled          \
            ..                          \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# To test the results
# you need a graphical session,
# then issue dbus-run-session ninja test.
# echo "?. Ninja Test ..."
# echo "?. Ninja Test ..." >> $LFSLOG_PROCESS
# echo "?. Ninja Test ..." >> $PKGLOG_ERROR
# dbus-run-session ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# Read configuring GTK 4
# https://www.linuxfromscratch.org/blfs/view/12.2/x/gtk4.html


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
