# b.24.24.1.3.libinput-1.23.0.sh
#
# Dependencies Required:
#
#               24.24.1.1 libevdev 1.13.1
#               09.75     mtdev-1.1.6
#
#
# Required by:
#
#               24.24.1.4 Xorg Libinput Driver 1.3.0
#

export PKG="libinput-1.23.0"
export PKGLOG_DIR=$LFSLOG/24.24.1.3
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. Meson Configure ..."
echo "2. Meson Configure ..." >> $LFSLOG_PROCESS
echo "2. Meson Configure ..." >> $PKGLOG_ERROR
meson setup --prefix=$XORG_PREFIX       \
            --buildtype=release         \
            -Ddebug-gui=false           \
            -Dtests=false               \
            -Dlibwacom=false            \
            -Dudev-dir=/usr/lib/udev    \
            ..                          \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test NOT executed, very compliated ..."
echo "4. Ninja Test NOT executed, very compliated ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test NOT executed, very compliated ..." >> $PKGLOG_ERROR

# echo "4. Ninja Test ..."
# echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
# echo "4. Ninja Test ..." >> $PKGLOG_ERROR
# ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
