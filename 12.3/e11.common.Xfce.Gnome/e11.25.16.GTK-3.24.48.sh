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
#               e10.28.07  hicolor-icon-theme-0.18 (test)
#               e10.11.12  ISO.Codes-4.17.0
#               e10.09.71  libxkbcommon-1.8.0
#               a.08.91.38 libxslt-1.1.43
#               d10.09.97  Wayland-1.23.0
#               d10.09.98  Wayland-Protocols-1.40
#               d10.09.17  GLib-2.82.5
#
# Dependencies Runtime: needed for current configuration
#
#               e21.28.01    adwaita-icon-theme-47.0 (recommended)
#               d20.24.28.04 DejaVu-fonts-ttf-2.37
#               e11.28.06    gnome-themes-extra-3.28
#

#
# Required by:
#
#               e23.35.03 libxfce4ui-4.20.0
#               e23.35.04 Exo-4.20.0
#               e23.35.05 Garcon-4.20.0
#               e23.35.06 libwnck-43.2
#               e23.35.08 libxfce4windowing-4.20.2
#               e11.25.32 libhandy-1.8.3
#               e11.25.35 libnotify-0.8.4
#               e11.41.14 XScreenSaver-6.09
#               e11.04.21 polkit-gnome-0.105
#               e21.28.01 adwaita-icon-theme-47.0
#               e41.28.01 adwaita-icon-theme-47.0
#               e11.28.06 gnome-themes-extra-3.28
#               e21.33.07 VTE-0.78.4
#               e42.33.07 VTE-0.76.4
#               g42.41.12 xarchiver-0.5.4.23
#               g42.34.04 Evince-46.3.1
#               e44.34.04 Evince-46.3.1
#               g22.40.03 Firefox-140.1.0esr        (errata)
#               e41.09.03 appstream-glib-0.8.3
#               e41.10.17 libgxps-0.3.2
#               e41.25.07 colord-gtk-0.3.1
#               e41.25.20 gtk-vnc-1.5.0
#               e41.25.22 gtksourceview4-4.8.4
#               e41.25.45 WebKitGTK-2.48.3          (errata)
#               e41.25.47 xdg-desktop-portal-gtk-1.15.2
#               e42.33.11 gnome-autoar-0.4.5
#               e42.33.12 gnome-desktop-44.1
#               e42.33.18 libgweather-4.4.4
#               e42.33.19 libpeas-1.36.0
#               e43.33.31 DConf-0.40.0
#               e44.34.08 gnome-color-manager-3.36.2
#               e44.34.12 gnome-nettool-42.0
#               e44.34.13 gnome-power-manager-43.0
#               e44.34.14 gnome-screenshot-41.0
#               e44.34.18 Gucharmap-16.0.2
#
# Recommended by:
#
#               e11.42.26 libcanberra-0.30
#               g22.39.03 LibreOffice-25.2.3	(errata)
#               e41.09.55 libportal-0.9.1
#               e41.11.10 ibus-1.5.31
#               e41.16.01 Avahi-0.8
#               e42.33.01 Gcr-3.41.2
#               e42.33.10 Gjs-1.82.1
#               e42.33.21 evolution-data-server-3.54.3
#               e43.33.33 Gvfs-1.56.1
#
# Optionally by:
#
#               e11.28.09 lxde-icon-theme-0.5.1
#               e11.10.33 Poppler-25.02.0 (GTK)
#           ??? e11.42.49 PulseAudio-17.0 (GTK) ???
#               e41.42.13 gstreamer-1.26.3          (errata)
#               e41.42.14 gst-plugins-base-1.26.3   (errata)
#               e41.42.15 gst-plugins-good-1.26.3   (errata)
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
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
gtk-icon-theme-name = Adwaita
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
