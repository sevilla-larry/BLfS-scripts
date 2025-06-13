# e43.33.31.DConf-0.40.0.sh
#

#
# Dependencies Required:
#               
#               d10.09.17 GLib-2.82.5
#               xxx.xx.xx dbus-1.16.0
#               xxx.xx.xx GTK-3.24.48
#               xxx.xx.xx libhandy-1.8.3
#               xxx.xx.xx libxml2-2.13.6
#
# Dependencies Recommended:
#
#                e11.13.35 Vala-0.56.17
#                xxx.xx.xx libxslt-1.1.42               
#               

#
# Required by:
#
#

export PKG="DConf-0.40.0"
export PKGLOG_DIR=$LFSLOG/33.31
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

sed -i 's/install_dir: systemd_userunitdir,//' service/meson.build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr             \
            --buildtype=release       \
            -D bash_completion=false  \
            ..
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cd ..              &&
tar -xf ../dconf-editor-45.0.1.tar.xz &&
cd dconf-editor-45.0.1                &&

mkdir build
cd    build

echo "5. Meson Setup ..."
echo "5. Meson Setup ..." >> $LFSLOG_PROCESS
echo "5. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr             \
            --buildtype=release       \
            ..
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "6. Ninja Build ..."
echo "6. Ninja Build ..." >> $LFSLOG_PROCESS
echo "6. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "7. Ninja Install ..."
echo "7. Ninja Install ..." >> $LFSLOG_PROCESS
echo "7. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
