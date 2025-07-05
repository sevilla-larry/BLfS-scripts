# e41.17.18.libsoup-3.6.5.sh
# (errata)
#

#
# Dependencies Required:
#
#               e41.17.04  glib-networking-2.80.1
#               a.08.91.64 libpsl-0.21.5
#               a.08.91.08 libxml2-2.14.3   (errata)
#               a.08.91.67 nghttp2-1.64.0
#               a.08.91.18 SQLite-3.49.1
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               e10.13.36 Vala-0.56.17
#
# Dependencies Optional (required for test suite):
#
#           ??? c13.20.01 Apache-2.4.63 ???
#               a.08.93.04 cURL-8.14.1  (errata)
#
# Dependencies Optional:
#
#               a.08.91.22 brotli-1.1.0
#

#
# Required by:
#
#               e41.17.03 GeoClue-2.7.2
#               e41.25.45 WebKitGTK-2.46.6
#
# Recommended by:
#
#               e41.42.15 gst-plugins-good-1.24.12
#               e42.33.22 tinysparql-3.8.2.sh
#

export PKG="libsoup-3.6.5"
export PKGLOG_DIR=$LFSLOG/17.18
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


sed 's/apiversion/soup_version/'    \
    -i docs/reference/meson.build   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr           \
            --buildtype=release     \
            --wrap-mode=nofallback  \
            ..                      \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILDPKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
