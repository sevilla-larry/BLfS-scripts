# d10.09.17.GLib-2.82.5.sh
#

#
# Dependencies Required (hidden)
#
#           ??? a.08.91.20.01 Packaging-24.2
#               a.08.93.05    Git-2.48.1
#
# Dependencies Recommended:
#
#               d10.13.24.07 docutils-0.21.2
#               a.08.91.38 libxslt-1.1.43 (errata)
#               a.08.91.11 PCRE2-10.45
#
# Dependencies Runtime:
#
#               d10.12.10 dbus-1.16.0
#               d10.11.16 shared-mime-info-2.4
#               d10.11.04 desktop-file-utils-0.28
#
# Dependencies Optional:
#
#               d10.12.10    dbus-1.16.0 (Pass1)
#               a.08.91.37   docbook-xsl-nons-1.79.2
#               a.08.91.36   docbook-xml-4.5
#               b10.13.24.13 Mako-1.3.9
#           ??? e21.25.04    Cairo-1.18.2 (circular)
#

#
# Required by:
#
#               d10.04.20 Polkit-126
#               d10.11.04 desktop-file-utils-0.28
#               d10.11.16 shared-mime-info-2.4
#				e23.35.01 libxfce4util-4.20.0
#               e23.35.07 xfce4-dev-tools-4.20.0
#               e23.35.12 tumbler-4.20.0
#               e10.09.45 libgudev-238
#               e11.25.03 at-spi2-core-2.54.1
#               e10.25.10 gdk-pixbuf-2.42.12
#               e10.25.37 Pango-1.56.1
#               e11.13.36 Vala-0.56.17
#               e11.25.36 libxklavier-5.4
#               e11.33.03 gsettings-desktop-schemas-47.1
#               e11.10.33 Poppler-25.02.0
#               e11.09.13 enchant-2.8.2
#               e41.42.13 gstreamer-1.24.12
#               e10.09.29 JSON-GLib-1.10.6
#               e41.09.19 GLibmm-2.82.0
#               e13.09.36 libblockdev-3.3.1
#               e41.09.55 libportal-0.9.1
#               e41.09.73 libxmlb-0.3.21
#               e41.11.22 xdg-dbus-proxy-0.1.6
#               e11.12.08 Colord-1.4.7
#               e13.12.35 UDisks-2.10.1     (errata sed)
#               e13.13.24.06 D-Bus.Python-1.3.2
#               e13.13.24.23 PyGObject-3.50.0
#               e41.16.01 Avahi-0.8
#               e41.17.04 glib-networking-2.80.1
#               e41.25.15 Graphene-1.10.8
#               e41.25.17 GTK-4.16.12
#               e41.42.13 gstreamer-1.26.3
#               e41.42.58 Wireplumber-0.5.8
#               e42.33.01 Gcr-3.41.2
#               e42.33.02 Gcr-4.3.1
#               e42.33.04 libsecret-0.21.6
#               e42.33.10 Gjs-1.82.1
#               e42.33.13 gnome-menus-3.36.0
#               e42.33.16 libgee-0.20.8
#               e11.33.17 libgtop-2.41.3
#               e42.33.19 libpeas-1.36.0
#               e43.33.31 DConf-0.40.0
#               e43.33.33 Gvfs-1.56.1
#               e33.37.18 libfm-extra-1.3.2
#               e34.38.04 pavucontrol-qt-2.1.0
#               09.07 dbus-glib-0.112               ???
#               etc
#
# Recommended by:
#
#               d10.10.12 harfBuzz-10.4.0
#				e10.25.04 Cairo-1.18.2
#               e11.12.02 AccountsService-23.13.9
#               e11.10.24 librsvg-2.59.2
#               e11.33.07 VTE-0.78.4
#               e42.33.07 VTE-0.76.4
#               f2.26.02  lightdm-1.32.0
#               e10.42.49 PulseAudio-17.0
#               g42.34.04 Evince-46.3.1
#               e44.34.04 Evince-46.3.1
#               e11.09.46 libgusb-0.4.9
#               e41.09.47 libical-3.0.19
#               e41.11.10 ibus-1.5.31
#               e41.17.18 libsoup-3.6.5 (errata)
#               e41.25.07 colord-gtk-0.3.1
#               e41.25.23 gtksourceview5-5.14.2
#               e41.25.45 WebKitGTK-2.46.6
#               e41.42.15 gst-plugins-base-1.26.3   (errata)
#               e42.33.05 rest-0.9.1
#               e42.33.06 totem-pl-parser-3.26.6
#               e42.33.09 geocode-glib-3.26.4
#               e42.33.12 gnome-desktop-44.1
#               e42.33.14 gnome-online-accounts-3.52.3.1
#               e42.33.18 libgweather-4.4.4
#               e42.33.20 libshumate-1.3.2
#               e42.33.21 evolution-data-server-3.54.3
#               e42.33.22 tinysparql-3.8.2
#               e42.33.24 GSound-1.0.3
#               e43.33.35 Nautilus-47.2
#               e43.33.41 Mutter-47.5
#               e44.34.03 EOG-47.0
#               e44.34.18 Gucharmap-16.0.2
#               e12.25.40 Qt-6.9.1              (errata/svn)
#               e13.09.36 libblockdev-3.3.1     (errata)
#
# Optionally by:
#
#               e11.25.35 libnotify-0.8.4
#               e10.12.37 UPower-1.90.7
#

export PKG="glib-2.82.5"
export PKGLOG_DIR=$LFSLOG/09.17
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

echo "1.1. Extract tar..."
echo "1.1. Extract tar..." >> $LFSLOG_PROCESS
echo "1.1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG
 

patch -Np1 -i ../glib-skip_warnings-1.patch \
        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "1.2. Meson Setup ..."
echo "1.2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "1.2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D introspection=disabled \
      -D glib_debug=disabled    \
      -D man-pages=disabled     \
      -D sysprof=disabled       \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -D man-pages=enabled      \

echo "1.3. Ninja Build ..."
echo "1.3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "1.3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "1.4. Ninja Install ..."
echo "1.4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "1.4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "2. GObject Introspection ..."
echo "2. GObject Introspection ..." >> $LFSLOG_PROCESS
echo "2. GObject Introspection ..." >> $PKGLOG_ERROR

echo "2.1. Extract tar GI ..."
echo "2.1. Extract tar GI ..." >> $LFSLOG_PROCESS
echo "2.1. Extract tar GI ..." >> $PKGLOG_ERROR
tar xvf ../../gobject-introspection-1.82.0.tar.xz   \
        >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

echo "2.2. Meson Setup GI ..."
echo "2.2. Meson Setup GI ..." >> $LFSLOG_PROCESS
echo "2.2. Meson Setup GI ..." >> $PKGLOG_ERROR
meson setup                             \
        gobject-introspection-1.82.0    \
        gi-build                        \
        --prefix=/usr                   \
        --buildtype=release             \
        >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "2.3. Ninja Build GI ..."
echo "2.3. Ninja Build GI ..." >> $LFSLOG_PROCESS
echo "2.3. Ninja Build GI ..." >> $PKGLOG_ERROR 
ninja -C gi-build   \
        >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "2.4. Ninja Test GI ..."
echo "2.4. Ninja Test GI ..." >> $LFSLOG_PROCESS
echo "2.4. Ninja Test GI ..." >> $PKGLOG_ERROR 
ninja -C gi-build test  \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "2.5. Ninja Install GI ..."
echo "2.5. Ninja Install GI ..." >> $LFSLOG_PROCESS
echo "2.5. Ninja Install GI ..." >> $PKGLOG_ERROR
ninja -C gi-build install   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "3. Generate Introspection Data ..."
echo "3. Generate Introspection Data ..." >> $LFSLOG_PROCESS
echo "3. Generate Introspection Data ..." >> $PKGLOG_ERROR

echo "3.1. Meson configure ..."
echo "3.1. Meson configure ..." >> $LFSLOG_PROCESS
echo "3.1. Meson configure ..." >> $PKGLOG_ERROR
meson configure                     \
        -D introspection=enabled    \
        >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3.2. Ninja Build ..."
echo "3.2. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3.2. Ninja Build ..." >> $PKGLOG_ERROR 
ninja >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3.3. Ninja Install ..."
echo "3.3. Ninja Install ..." >> $LFSLOG_PROCESS
echo "3.3. Ninja Install ..." >> $PKGLOG_ERROR
ninja install >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# The GLib test suite requires desktop-file-utils and shared-mime-info
# and requires non-root user
# Test Suite NOT executed


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
