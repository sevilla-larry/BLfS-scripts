# d.24.25.01.01.libevdev 1.13.3.sh
#

#
# Required by:
#
#               d20.24.25.1.2 Xorg Evdev Driver 2.10.6
#               d20.24.25.1.3 libinput-1.26.1
#

#
# Kernel config
#
#       Device Drivers  --->
#         Input device support --->
#           <*> Generic input layer (needed for keyboard, mouse, ...) [CONFIG_INPUT]
#           <*>   Event interface                   [CONFIG_INPUT_EVDEV]
#           [*]   Miscellaneous devices  --->       [CONFIG_INPUT_MISC]
#             <*/m>    User level driver support    [CONFIG_INPUT_UINPUT]
#
#               The last item is not strictly required for libevdev.
#               If it is compiled as a module, it is not loaded automatically.
#               It is needed for full test coverage.
#

export PKG="libevdev-1.13.3"
export PKGLOG_DIR=$LFSLOG/24.25.1.1
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. Meson Configure ..."
echo "2. Meson Configure ..." >> $LFSLOG_PROCESS
echo "2. Meson Configure ..." >> $PKGLOG_ERROR
meson setup     ..                              \
                --prefix=$XORG_PREFIX           \
                --buildtype=release             \
                -D documentation=disabled       \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test NOT executed, should be in graphical session ..."
echo "4. Ninja Test NOT executed, should be in graphical session ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test NOT executed, should be in graphical session ..." >> $PKGLOG_ERROR

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
