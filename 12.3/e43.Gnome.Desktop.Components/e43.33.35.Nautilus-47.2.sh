# e43.33.35.Nautilus-47.2.sh
#

#
# Dependencies Required:
#
#                   xxx.xx.xx Exiv2-0.28.5
#                   xxx.xx.xx bubblewrap-0.11.0
#                   e43.33.34 gexiv2-0.14.3
#                   e42.33.11 gnome-autoar-0.4.5
#                   e42.33.12 gnome-desktop-44.1
#                   xxx.xx.xx libadwaita-1.6.4
#                   xxx.xx.xx libnotify-0.8.4 
#                   xxx.xx.xx libportal-0.9.1
#                   xxx.xx.xx libseccomp-2.6.0
#                   e42.33.22 tinysparql-3.8.2
#

# Dependecies Recommended:
#
#                   xxx.xx.xx desktop-file-utils-0.28
#                   xxx.xx.xx Exempi-2.6.5   
#                   xxx.xx.xx gst-plugins-base-1.24.12
#                   xxx.xx.xx libcloudproviders-0.3.6 
#                   xxx.xx.xx libexif-0.6.25
#                   d10.09.17 Glib-2.82.5  
#
# Required by:
#
#

export PKG="nautilus-47.2"
export PKGLOG_DIR=$LFSLOG/33.35
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

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
