# e11.25.16.GTK-3.24.48.sh
#

#
# Dependencies Required:
#
#               e11.25.03 at-spi2-core-2.54.1
#               e10.25.10 gdk-pixbuf-2.42.12
#               d20.25.34 libepoxy-1.5.10
#               e10.25.37 Pango-1.56.1
#
# Dependencies Recommended:
#
#               a.08.91.37 docbook-xsl-nons-1.79.2
#               e10.28.07  hicolor-icon-theme-0.18   (test)      ???
#                          ISO.Codes-4.17.0                 ???
#                          libxkbcommon-1.8.0               ???
#               a.08.91.38 libxslt-1.1.43
#               d10.09.97  Wayland-1.23.0
#               d10.09.98  Wayland-Protocols-1.40
#               d10.09.17  GLib-2.82.5
#
# Dependencies Runtime: needed for current configuration
#
#               e21.28.01    adwaita-icon-theme-47.0 (recommended) ???
#                            oxygen-icons-6.0.0             ???
#               d20.24.28.04 DejaVu-fonts-ttf-2.37
#                            gnome-themes-extra-3.28        ???
#

#
# Required by:
#
#               e23.35.03 libxfce4ui-4.20.0
#               e23.35.04 Exo-4.20.0
#               e23.35.05 Garcon-4.20.0
#               e23.35.06 libwnck-43.2
#               e23.35.08 libxfce4windowing-4.20.2
#               e21.25.35 libnotify-0.8.4
#               e11.28.01 adwaita-icon-theme-46.2           ???
#               g12.40.03 Firefox-128.4.0esr (errata)       ???
#
# Recommended by:
#
#               e11.42.27 libcanberra-0.30                  ???
#               g12.39.03 LibreOffice-24.8.0                ???
#
# Optionally by:
#
#               e11.28.09 lxde-icon-theme-0.5.1             ???
#               e11.42.14 gstreamer-1.24.7                  ???
#               e11.42.15 gst-plugins-base-1.24.7           ???
#               e11.42.16 gst-plugins-good-1.24.7           ???
#               e11.42.17 gst-plugins-bad-1.24.7            ???
#

export PKG="gtk-3.24.48"
export PKGLOG_DIR=$LFSLOG/25.16
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

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
      -D man=true               \
      -D broadway_backend=true  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -D man=false               \ Adwaita NOT installed?

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
# https://www.linuxfromscratch.org/blfs/view/12.3/x/gtk3.html

mkdir -vp /etc/gtk-3.0  > $PKGLOG_OTHERS    2>> $PKGLOG_ERROR

cat > /etc/gtk-3.0/settings.ini << "EOF"    2>> $PKGLOG_ERROR
[Settings]
gtk-theme-name = Adwaita
gtk-application-prefer-dark-theme=true
gtk-icon-theme-name = oxygen
gtk-font-name = DejaVu Sans 12
gtk-cursor-theme-size = 18
gtk-toolbar-style = GTK_TOOLBAR_BOTH_HORIZ
gtk-xft-antialias = 1
gtk-xft-hinting = 1
gtk-xft-hintstyle = hintslight
gtk-xft-rgba = rgb
gtk-cursor-theme-name = Adwaita
EOF

cat > /etc/gtk-3.0/gtk.css << "EOF"         2>> $PKGLOG_ERROR
*  {
   -GtkScrollbar-has-backward-stepper: 1;
   -GtkScrollbar-has-forward-stepper: 1;
}
EOF


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
