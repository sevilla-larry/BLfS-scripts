# e11.25.17.GTK+-3.24.43.sh
#

#
# Dependencies Required:
#
#               e11.25.03 at-spi2-core-2.52.0
#               e10.25.10 gdk-pixbuf-2.42.12
#               d20.25.35 libepoxy-1.5.10
#               e10.25.38 Pango-1.54.0
#
# Dependencies Recommended:
#
#               e21.28.01 adwaita-icon-theme-46.2   (runtime)
#               e10.28.07 hicolor-icon-theme-0.18   (test)
#               d10.09.74 libxslt-1.1.42
#               d10.09.97 Wayland-1.23.0
#               d10.09.98 Wayland-Protocols-1.36
#               d10.09.17 GLib-2.80.4
#

#
# Required by:
#
#               e11.28.01 adwaita-icon-theme-46.2
#               e21.25.36 libnotify-0.8.3
#               e23.35.03 libxfce4ui-4.18.6
#               e23.35.04 Exo-4.18.0
#               e23.35.05 Garcon-4.18.2
#               e23.35.06 libwnck-43.0
#
# Recommended by:
#
#               e11.42.27 libcanberra-0.30
#               g12.39.03 LibreOffice-24.8.0
#
# Optionally by:
#
#               e11.28.09 lxde-icon-theme-0.5.1
#               e11.42.14 gstreamer-1.24.7
#               e11.42.15 gst-plugins-base-1.24.7
#               e11.42.16 gst-plugins-good-1.24.7
#               e11.42.17 gst-plugins-bad-1.24.7
#

export PKG="gtk+-3.24.43"
export PKGLOG_DIR=$LFSLOG/25.17
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
meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D man=false              \
      -D broadway_backend=true  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -D man=true               \

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

# Read configuring GTK+ 3
# https://www.linuxfromscratch.org/blfs/view/12.2/x/gtk3.html


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
