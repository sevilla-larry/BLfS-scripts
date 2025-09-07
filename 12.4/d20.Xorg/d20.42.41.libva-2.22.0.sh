# d20.42.41.libva-2.22.0.sh
# for PCs with CPU/iGPU Intel 2th Gen & up
#

#
# Dependencies Required:
#
#               d20.24.01 Xorg build environment
#               d20.25.31 Libdrm-2.4.125
#
#
# Dependencies Recommended:
#
#               d20.24.12 Mesa-25.1.8   (Pass #2)
#
#
# Dependencies Runtime:
#
#               d20.42.21 intel-vaapi-driver-2.4.1  (i7-4790)
#                           intel-media-driver      (ix-5xxx & up)
#
# Dependencies Optional:
#
#               d10.09.99 Wayland-1.24.0
#

#
# Required by:
#
#               d20.42.21 intel-vaapi-driver-2.4.1
#               d20.42.43 libvdpau-va-gl-0.4.2
#
# Recommended by:
#
#               d20.24.12 Mesa-25.1.8   (Pass #1)
#               e10.44.01 FFmpeg-7.1
#               e41.42.16 gst-plugins-bad-1.26.3
#

#
# read: https://www.linuxfromscratch.org/blfs/view/12.4/multimedia/libva.html
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
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=$XORG_PREFIX   \
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


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
