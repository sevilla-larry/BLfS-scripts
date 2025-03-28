# d20.24.25.1.3.libinput-1.27.1.sh
#

#
# Dependencies Required:
#
#               d20.24.25.1.1 libevdev-1.13.2
#               d10.09.79     mtdev-1.1.7
#

#
# Required by:
#
#               d20.24.25.1.4 Xorg Libinput Driver 1.4.0
#
# Recommended by:
#
#               e12.25.42 Qt-6.7.2
#

#
# Kernel config
#
#       Device Drivers  --->
#         Input device support --->
#           <*> Generic input layer (needed for keyboard, mouse, ...) [CONFIG_INPUT]
#           [*]   Miscellaneous devices  --->       [CONFIG_INPUT_MISC]
#             <*/m>    User level driver support    [CONFIG_INPUT_UINPUT]
#

export PKG="libinput-1.27.1"
export PKGLOG_DIR=$LFSLOG/24.25.1.3
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

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
meson setup ..                  \
      --prefix=$XORG_PREFIX     \
      --buildtype=release       \
      -D debug-gui=false        \
      -D tests=false            \
      -D libwacom=false         \
      -D udev-dir=/usr/lib/udev \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test NOT executed, very complicated ..."
echo "4. Ninja Test NOT executed, very complicated ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test NOT executed, very complicated ..." >> $PKGLOG_ERROR

# echo "4. Ninja Test ..."
# echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
# echo "4. Ninja Test ..." >> $PKGLOG_ERROR
# ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
