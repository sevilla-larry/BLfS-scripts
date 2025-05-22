# e10.25.10.gdk-pixbuf-2.42.12.sh
#

#
# Dependencies Required:
#
#               d10.09.17 GLib-2.82.5
#               e10.10.18 libjpeg-turbo-3.0.1
#               d10.10.22 libpng-1.6.46
#               d10.11.16 shared-mime-info-2.4
#
# Dependencies Recommended:
#
#               d10.13.24.07 docutils-0.21.2
#               e11.10.24 librsvg-2.59.2
#               e10.10.26 libtiff-4.7.0
#

#
# Required by:
#
#               e21.25.16 GTK-3.24.48
#               e11.10.24 librsvg-2.59.2
#               e10.25.48 xdg-desktop-portal-1.18.2 ???
#               ???       GTK+-2.24.33              ???
#               ??? 25.13 gdk-pixbuf-xlib-2.40.2    ???
#
# Optionally by:
#
#               e23.35.12 tumbler-4.20.0
#               e11.10.33 Poppler-25.02.0
#

export PKG="gdk-pixbuf-2.42.12"
export PKGLOG_DIR=$LFSLOG/25.10
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

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                      \
            --prefix=/usr           \
            --buildtype=release     \
            -D others=enabled       \
            --wrap-mode=nofallback  \
            -D man=false            \
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
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
