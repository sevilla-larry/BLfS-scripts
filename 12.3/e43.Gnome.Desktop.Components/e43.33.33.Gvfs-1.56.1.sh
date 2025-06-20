# e43.33.33.Gvfs-1.56.1.sh
#

#
# Dependencies Required:
#
#               d20.12.11 dbus-1.16.0
#               d10.09.17 GLib-2.82.5
#               e42.33.02 Gcr-4.3.1
#               e10.09.69 libusb-1.0.27
#               e42.33.04 libsecret-0.21.6
#
# Dependencies Recommended:
#
#               e11.25.16 GTK-3.24.48
#             ? xxx.xx.xx libcdio-2.1.0
#               e10.09.45 libgudev-238
#               xxx.xx.xx libsoup-3.6.4
#               d10.12.12 elogind-255.17
#               xxx.xx.xx UDisks-2.10.1
#
# Dependencies Optional:
#
#             ? c13.20.01  Apache-2.4.63
#               e42.33.14  gnome-online-accounts-3.52.3.1
#               a.08.91.12 libarchive-3.8.1 (errata)
#               e42.33.15  libgdata-0.18.1
#               a.08.91.08 libxml2-2.14.3 (errata)
#               a.08.91.38 libxslt-1.1.43 (errata)
#               a.08.92.12 OpenSSH-9.9p2
#

#
# Required by:
#
#

export PKG="gvfs-1.56.1"
export PKGLOG_DIR=$LFSLOG/33.33
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
            -D onedrive=false   \
            -D fuse=false       \
            -D gphoto2=false    \
            -D afc=false        \
            -D cdda=false       \
            -D bluray=false     \
            -D nfs=false        \
            -D mtp=false        \
            -D smb=false        \
            -D tmpfilesdir=no   \
            -D dnssd=false      \
            -D goa=false        \
            -D google=false     \
            -D systemduserunitdir=no    \
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
