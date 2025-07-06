# e42.33.12.gnome-online-accounts-3.52.3.1.sh
#

#
# Dependencies Required:
#
#               e42.33.01.Gcr-3.41.2
#               e13.09.29 JSON-GLib-1.10.6
#               e41.25.28 libadwaita-1.6.4
#               e42.33.05 rest-0.9.1
#               e11.13.36 Vala-0.56.17
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#

#
# Required by:
#
#               e43.33.40 gnome-control-center-47.4
#
# Recommended by:
#
#               e42.33.21 evolution-data-server-3.54.3
#
# Optionally by:
#
#               e43.33.33 Gvfs-1.56.1
#

export PKG="gnome-online-accounts-3.52.3.1"
export PKGLOG_DIR=$LFSLOG/33.14
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
meson setup --prefix=/usr           \
            --buildtype=release     \
            -D documentation=false  \
            -D kerberos=false       \
            -D google_client_secret=5ntt6GbbkjnTVXx-MSxbmx5e                                                \
            -D google_client_id=595013732528-llk8trb03f0ldpqq6nprjp1s79596646.apps.googleusercontent.com    \
            ..                      \
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
