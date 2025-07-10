# e11.10.24.librsvg-2.59.2.sh
#

#
# Dependencies Required:
#
#               e10.25.04  Cairo-1.18.2
#               e10.13.01  cargo-c-0.10.11
#               e10.25.10  gdk-pixbuf-2.42.12
#               e10.25.37  Pango-1.56.1
#               e10.13.27  Rustc-1.85.0
#               a.08.91.40 make-ca-1.16
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               e11.13.36 Vala-0.56.17
#
# Dependencies Optional:
#
#               d20.24.17 Xorg Fonts
#

#
# Required by:
#
#               e21.28.01 adwaita-icon-theme-47.0
#               e11.28.06 gnome-themes-extra-3.28
#               e41.28.01 adwaita-icon-theme-47.0
#
# Recommended by:
#
#               g22.39.03 LibreOffice-25.2.3	(errata)
#               e41.25.17 GTK-4.16.12
#               e44.34.03 EOG-47.0
#
# Optionally by:
#
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
#

export PKG="librsvg-2.59.2"
export PKGLOG_DIR=$LFSLOG/10.24
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


sed -e "/OUTDIR/s|,| / 'librsvg-2.59.2', '--no-namespace-dir',|"    \
    -e '/output/s|Rsvg-2.0|librsvg-2.59.2|'                         \
    -i doc/meson.build                                              \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr       \
            --buildtype=release \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
# One test, Rust tests (rsvg), is known to fail.

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
