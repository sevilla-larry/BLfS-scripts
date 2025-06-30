# e43.34.04.Evince-46.3.1.sh
#

#                        
#
# Dependencies Required:
#
#               xxx.xx.xx adwaita-icon-theme-47.0
#               xxx.xx.xx gsettings-desktop-schemas-47.1
#               xxx.xx.xx GTK-3.24.48
#               xxx.xx.xx itstool-2.0.7
#               xxx.xx.xx libhandy-1.8.3
#               xxx.xx.xx libxml2-2.13.6
#               xxx.xx.xx OpenJPEG-2.5.3
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               xxx.xx.xx gnome-keyring-46.2
#               xxx.xx.xx libarchive-3.7.7
#               xxx.xx.xx libsecret-0.21.6
#               xxx.xx.xx Poppler-25.02.0

# Required by:
#
#

export PKG="evince-46.3.1"
export PKGLOG_DIR=$LFSLOG/34.04
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
    CPPFLAGS+=" -I/opt/texlive/2024/include" \  
meson setup --prefix=/usr                    \
            --buildtype=release              \
            -D gtk_doc=false                 \
            --wrap-mode=nodownload           \
            -D systemduserunitdir=no         \
            ..                               \
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
