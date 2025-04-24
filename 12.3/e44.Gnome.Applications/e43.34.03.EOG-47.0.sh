# e43.34.03.EOG-47.0.sh
#

#                        
#
# Dependencies Required:
#
#               xxx.xx.xx adwaita-icon-theme-47.0
#               xxx.xx.xx Exempi-2.6.5
#               xxx.xx.xx gnome-desktop-44.1
#               xxx.xx.xx libhandy-1.8.3
#               xxx.xx.xx libjpeg-turbo-3.0.1
#               xxx.xx.xx libpeas-1.36.0
#               xxx.xx.xx shared-mime-info-2.4
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               xxx.xx.xx Little CMS-2.17
#               xxx.xx.xx libexif-0.6.25
#               xxx.xx.xx librsvg-2.59.2
#               xxx.xx.xx webp-pixbuf-loader-0.2.7

# Required by:
#
#

export PKG="eog-47.0"
export PKGLOG_DIR=$LFSLOG/34.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
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
