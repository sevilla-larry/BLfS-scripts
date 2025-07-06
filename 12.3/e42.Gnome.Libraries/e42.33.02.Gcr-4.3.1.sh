# e42.33.02.Gcr-4.3.1.sh
#

#
# Dependencies Required:
#
#               d10.09.17  GLib-2.82.5
#               a.08.91.35 libgcrypt-1.11.0
#               a.08.91.39 p11-kit-0.25.5
#
# Dependencies Recommended:
#
#           ??? e41.04.06  GnuPG-2.4.7  (deferred due to OpenLDAP)
#               e41.25.17  GTK-4.16.12
#               e42.33.04  libsecret-0.21.6
#               a.08.91.38 libxslt-1.1.43 (errata)
#               a.08.92.12 OpenSSH-9.9p2
#               e10.13.36  Vala-0.56.17
#
# Dependencies Optional:
#
#               a.08.91.63 GnuTLS-3.8.9
#

#
# Required by:
#
#               e43.33.33 Gvfs-1.56.1
#				e43.33.38 gnome-settings-daemon-47.2
#               e43.33.42 gnome-shell-47.4
#

export PKG="gcr-4.3.1"
export PKGLOG_DIR=$LFSLOG/33.02
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
meson setup --prefix=/usr       \
            --buildtype=release \
            -D gtk_doc=false    \
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
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
