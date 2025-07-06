# e43.34.18.Gucharmap-16.0.2.sh
#

#
# Dependencies Required:
#
#               d10.11.04  desktop-file-utils-0.28
#               e11.33.03  gsettings-desktop-schemas-47.1
#               e11.25.16  GTK-3.24.48
#               e11.49.05  itstool-2.0.7
#               a.08.91.12 libarchive-3.8.1
#               a.08.91.11 PCRE2-10.45
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               e11.13.36 Vala-0.56.17
#
# Dependencies Optional:
#
#               e41.09.03 appstream-glib-0.8.3
#

export PKG="Gucharmap-16.0.2"
export PKGLOG_DIR=$LFSLOG/34.18
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

mkdir ucd                     &&
pushd ucd                     &&
  unzip ../../../UCD.zip      &&
  cp -v ../../../Unihan.zip . &&
popd                          &&

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr            \
            --strip                  \
            --buildtype=release      \
            -D ucd_path=./ucd        \
            -D docs=false            \
            ..                       \
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
