# e43.34.03.EOG-47.0.sh
#

#
# Dependencies Required:
#
#               e41.28.01 adwaita-icon-theme-47.0
#               e41.09.14 Exempi-2.6.5
#               e42.33.12 gnome-desktop-44.1
#               e11.25.32 libhandy-1.8.3
#               e10.10.18 libjpeg-turbo-3.0.1
#               e42.33.19 libpeas-1.36.0
#               d10.11.16 shared-mime-info-2.4
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               e10.10.14 Little CMS-2.16
#               e10.10.16 libexif-0.6.25
#               e10.10.24 librsvg-2.59.2
#               e41.10.38 webp-pixbuf-loader-0.2.7
#
# Dependencies Optional:
#
#               e41.09.55 libportal-0.9.1
#

export PKG="eog-47.0"
export PKGLOG_DIR=$LFSLOG/34.03
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
meson setup --prefix=/usr        \
            --buildtype=release  \
            --buildtype=release  \
            -D libportal=false   \
            ..                   \
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
