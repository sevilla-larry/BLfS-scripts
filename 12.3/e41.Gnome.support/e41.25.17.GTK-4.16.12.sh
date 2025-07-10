# e41.25.17.GTK-4.16.12.sh
#

#
# Dependencies Required:
#
#               e10.10.06 FriBidi-1.0.16
#               e10.25.10 gdk-pixbuf-2.42.12
#               e41.25.15 Graphene-1.10.8
#               e10.11.12 ISO Codes-4.17.0
#               d20.25.34 libepoxy-1.5.10
#               e10.09.71 libxkbcommon-1.8.0
#               e10.25.37 Pango-1.56.1
#               e41.13.24.23 PyGObject-3.50.0
#               d10.09.98 Wayland-Protocols-1.40
#               d10.09.17 GLib-2.82.5
#
# Dependencies Recommended:
#
#               e41.28.01 adwaita-icon-theme-47.0   (settings keys)
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
#               e41.11.06 glslc from shaderc-2024.4 (PCs)
#               e41.42.15 gst-plugins-good-1.26.3   (errata) (runtime)
#               e10.28.07 hicolor-icon-theme-0.18   (test)
#               e11.10.24 librsvg-2.59.2
#               d20.25.44 Vulkan-Loader-1.4.304     (PCs)
#
# Dependencies Optional:
#
#               e11.12.08 colord-1.4.7
#           ??? e41.09.39 libcloudproviders-0.3.6   ???
#               e42.33.22 tinysparql-3.8.2
#

#
# Required by:
#
#               e42.33.07 VTE-0.76.4
#               e41.25.19 Gtkmm-4.16.0
#               e41.25.28 libadwaita-1.6.4
#               e41.25.45 WebKitGTK-2.46.6
#               e41.28.01 adwaita-icon-theme-47.0
#               e42.33.12 gnome-desktop-44.1
#               e42.33.20 libshumate-1.3.2
#               e42.33.25 xdg-desktop-portal-gnome-47.3
#               e43.33.45 gnome-tweaks-46.1
#               e44.34.01 Baobab-47.0
#               e44.34.06 File-Roller-44.5
#
# Recommended by:
#
#               e41.09.55 libportal-0.9.1
#               e41.11.10 ibus-1.5.31
#               e42.33.02 Gcr-4.3.1
#               e41.25.07 colord-gtk-0.3.1
#               e42.33.10 Gjs-1.82.1
#               e42.33.21 evolution-data-server-3.54.3
#
# Optionally by:
#
#               g22.39.03 LibreOffice-25.2.3	(errata)
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

if [ "$COMPUTER_TYPE" = "PC" ]; then
     export VULKAN_FLAG=enabled
else
     export VULKAN_FLAG=disabled
fi

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr               \
            --buildtype=release         \
            -D broadway-backend=true    \
            -D introspection=enabled    \
            -D vulkan=$VULKAN_FLAG      \
            ..                          \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
env -u{GALLIUM_DRIVER,MESA_LOADER_DRIVER_OVERRIDE}  \
    LIBGL_ALWAYS_SOFTWARE=1                         \
    VK_LOADER_DRIVERS_SELECT='lvp*'                 \
    dbus-run-session                                \
    meson test  --setup x11                         \
                --no-suite={headless,needs-udmabuf} \
                > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# Read configuring GTK 4
# https://www.linuxfromscratch.org/blfs/view/12.3/x/gtk4.html

mkdir -vp /usr/share/gtk-4.0  > $PKGLOG_OTHERS    2>> $PKGLOG_ERROR

cat > /usr/share/gtk-4.0/settings.ini << "EOF"    2>> $PKGLOG_ERROR
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

cat > /usr/share/gtk-4.0/gtk.css << "EOF"         2>> $PKGLOG_ERROR
*  {
   -GtkScrollbar-has-backward-stepper: 1;
   -GtkScrollbar-has-forward-stepper: 1;
}
EOF


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset VULKAN_FLAG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
