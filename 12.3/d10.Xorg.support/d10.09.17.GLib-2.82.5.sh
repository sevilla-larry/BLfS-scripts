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
#           ??  e21.25.04 Cairo-1.18.0 (circular)
#               d10.12.10 dbus-1.16.0 (Pass1)
#               a.08.91.37 docbook-xsl-nons-1.79.2
#               a.08.91.36 docbook-xml-4.5
#               b10.13.24.13 Mako-1.3.9
#

#
# Required by:
#
#               d10.04.20 Polkit-126
#               d10.11.04 desktop-file-utils-0.28
#               d10.11.16 shared-mime-info-2.4
#				e23.35.01.libxfce4util-4.18.2       ???
#               37.02 libfm-extra-1.3.2             ???
#               25.02 at-spi2-core-2.48.3           ???
#               25.12 gdk-pixbuf-2.42.10            ???
#               25.43 Pango-1.50.14                 ???
#               09.07 dbus-glib-0.112               ???
#               etc
#
# Recommended by:
#
#               d10.10.12 harfBuzz-10.4.0
#               f2.26.02  lightdm-1.32.0
#               e12.25.42 Qt-6.7.2
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
