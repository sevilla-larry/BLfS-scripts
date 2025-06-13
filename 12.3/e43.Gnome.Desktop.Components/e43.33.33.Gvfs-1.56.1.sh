# e43.33.33.Gvfs-1.56.1.sh
#

#
# Dependencies Required:
#
#                   xxx.xx.xx dbus-1.16.0
#                   xxx.xx.xx Gcr-4.3.1
#                   d10.09.17 GLib-2.82.5
#                   xxx.xx.xx libusb-1.0.27
#                   xxx.xx.xx libsecret-0.21.6
#         
# Dependencies Recommended:
#
#                   xxx.xx.xx GTK-3.24.48
#                   xxx.xx.xx libcdio-2.1.0
#                   xxx.xx.xx libgudev-238
#                   xxx.xx.xx libsoup-3.6.4
#                   xxx.xx.xx elogind-255.17
#                   xxx.xx.xx UDisks-2.10.1

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
meson setup --prefix=/usr        \
             --buildtype=release \
             -D onedrive=false   \
             -D fuse=false       \
             -D gphoto2=false    \
             -D afc=false        \
             -D bluray=false     \
             -D nfs=false        \
             -D mtp=false        \
             -D smb=false        \
             -D tmpfilesdir=no   \
             -D dnssd=false      \
             -D goa=false        \
             -D google=false     \
             -D systemduserunitdir=no 
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
