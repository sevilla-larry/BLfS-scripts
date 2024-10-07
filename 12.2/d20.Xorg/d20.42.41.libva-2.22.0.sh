# d20.42.41.libva-2.22.0.sh
#

#
# Dependencies Required:
#
#               d20.24.01 Xorg build environment
#               d20.25.38 Libdrm-2.4.122
#
#
# Dependencies Recommended:
#
#               d20.24.16 Mesa-24.1.5   (Pass #2)
#
#
# Dependencies Runtime:
#
#               d20.42.22 intel-vaapi-driver-2.4.1
#
# Dependencies Optional:
#
#               d10.09.97 Wayland-1.23.0
#

#
# Required by:
#
#               d20.42.22 intel-vaapi-driver-2.4.1
#               d20.42.43 libvdpau-va-gl-0.4.2
#
# Recommended by:
#
#               d20.24.16 Mesa-24.1.5   (Pass #1)
#
# read: https://www.linuxfromscratch.org/blfs/view/12.2/multimedia/libva.html
#

export PKG="libva-2.22.0"
export PKGLOG_DIR=$LFSLOG/42.41.$PKGPASS
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


# mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup     --prefix=$XORG_PREFIX   \
                --buildtype=release     \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
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
