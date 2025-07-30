# e10.25.04.Cairo-1.18.2.sh
#

#
# Dependencies Required:
#
#               d10.10.22 libpng-1.6.46
#               d10.10.32 Pixman-0.44.2
#
# Dependencies Recommended:
#
#               d10.10.05 Fontconfig-2.16.0
#               d10.09.17 GLib-2.82.5
#               d20.24.08 Xorg Libraries
#
# Dependencies Optional:
#
#               d20.25.33  Libdrm-2.4.124
#               a.08.91.08 libxml2-2.13.6
#               a.08.91.09 LZO-2.10
#

#
# Required by:
#
#               e23.35.09    xfce4-panel-4.20.3
#               e11.10.24    librsvg-2.59.2
#               e13.13.24.20 PyCairo-1.26.1
#               e41.25.06    libcairomm-1.18.0
#               e41.25.45    WebKitGTK-2.48.3       (errata)
#               e42.33.10    Gjs-1.82.1
#
# Recommended ( but needed ) by:
#
#               e10.25.37 Pango-1.56.1
#               e11.10.33 Poppler-25.02.0
#
# Recommended by:
#
#               e41.42.15 gst-plugins-good-1.26.3   (errata)
#

export PKG="cairo-1.18.2"
export PKGLOG_DIR=$LFSLOG/25.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR



cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
