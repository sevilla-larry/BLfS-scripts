# e43.34.06.File-Roller-44.5.sh
#

#
# Dependencies Required:
#
#               e41.25.17 GTK-4.16.12
#               e11.49.05 itstool-2.0.7
#
# Dependencies Recommended:
#
#               e41.12.09  cpio-2.15
#               d10.11.04  desktop-file-utils-0.28
#               e10.09.29  JSON-GLib-1.10.6
#               a.08.91.12 libarchive-3.8.1
#               e41.25.28  libadwaita-1.6.4
#               e41.09.55  libportal-0.9.1
#               e43.33.35  Nautilus-47.2
#
# Dependencies Optional (Runtime):
#
#               a.08.91.12 libarchive-3.8.1
#               a.08.91.04 Zip-3.0
#

export PKG="file-roller-44.5"
export PKGLOG_DIR=$LFSLOG/34.06
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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
            -D packagekit=false  \
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

chmod -v 0755 /usr/libexec/file-roller/isoinfo.sh   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

gtk-update-icon-cache -tf /usr/share/icons/hicolor  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
update-desktop-database                             \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
