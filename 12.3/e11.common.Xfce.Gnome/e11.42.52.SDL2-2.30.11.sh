# e11.42.52.SDL2-2.30.11.sh
#

#
# Dependencies Recommended:
#
#               e10.09.71 libxkbcommon-1.8.0
#               d10.09.98 Wayland-Protocols-1.40
#               d20.24.08 Xorg.Libraries
#
# Dependencies Optional:
#
#               e10.42.01 alsa-lib-1.2.13
#               e10.13.17 NASM-2.16.03
#               e11.42.49 PulseAudio-17.0 (GTK)
#           ??? ?11.42.49 PulseAudio-17.0 (???)
#

#
# Recommended by:
#
#               e11.10.27 libwebp-1.5.0
#               e11.44.01 FFmpeg-7.1
#
# Optionally by:
#
#               e41.42.15 gst-plugins-base-1.26.3   (errata)
#               e41.42.48 Pipewire-1.2.7
#               e41.42.57 v4l-utils-1.28.1
#

export PKG="SDL2-2.30.11"
export PKGLOG_DIR=$LFSLOG/42.52
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCESDIR=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr    \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -v /usr/lib/libSDL2*.a   \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
    

cd $SOURCESDIR
rm -rf $PKG
unset SOURCESDIR
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
