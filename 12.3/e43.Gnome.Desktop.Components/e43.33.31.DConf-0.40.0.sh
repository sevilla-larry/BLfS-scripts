# e43.33.31.DConf-0.40.0.sh
#

#
# Dependencies Required:
#
#               d20.12.11  dbus-1.16.0
#               d10.09.17  GLib-2.82.5
#               e11.25.16  GTK-3.24.48
#               e11.25.32  libhandy-1.8.3
#               a.08.91.08 libxml2-2.14.3 (errata)
#
# Dependencies Recommended:
#
#               e10.13.36  Vala-0.56.17
#               a.08.91.38 libxslt-1.1.43 (errata)
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
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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

sed -i  's/install_dir: systemd_userunitdir,//' \
        service/meson.build                     \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr               \
            --buildtype=release         \
            -D bash_completion=false    \
            ..                          \
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

echo "***** EDITOR *****" >> $PKGLOG_TAR
echo "***** EDITOR *****" >> $PKGLOG_CONFIG
echo "***** EDITOR *****" >> $PKGLOG_BUILD
echo "***** EDITOR *****" >> $PKGLOG_INSTALL
echo "***** EDITOR *****" >> $PKGLOG_ERROR

cd ..
echo "6. Editor Extract tar..."
echo "6. Editor Extract tar..." >> $LFSLOG_PROCESS
echo "6. Editor Extract tar..." >> $PKGLOG_ERROR
tar -xf ../dconf-editor-45.0.1.tar.xz   \
        >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd dconf-editor-45.0.1

mkdir build
cd    build

echo "7. Editor Meson Setup ..."
echo "7. Editor Meson Setup ..." >> $LFSLOG_PROCESS
echo "7. Editor Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr       \
            --buildtype=release \
            ..                  \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "8. Editor Ninja Build ..."
echo "8. Editor Ninja Build ..." >> $LFSLOG_PROCESS
echo "8. Editor Ninja Build ..." >> $PKGLOG_ERROR 
ninja >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "9. Editor Ninja Install ..."
echo "9. Editor Ninja Install ..." >> $LFSLOG_PROCESS
echo "9. Editor Ninja Install ..." >> $PKGLOG_ERROR
ninja install >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
