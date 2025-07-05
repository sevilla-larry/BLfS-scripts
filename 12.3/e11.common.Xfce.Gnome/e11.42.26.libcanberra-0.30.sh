# e11.42.26.libcanberra-0.30.sh
#

#
# Dependencies Required:
#
#               e10.42.44 libvorbis-1.3.7
#
# Dependencies Recommended:
#
#               e10.42.01 alsa-lib-1.2.13
#           ??? gstreamer-1.24.12           ???
#               e11.25.16 GTK-3.24.48
#
# Dependencies Optional:
#
#               e11.42.49 PulseAudio-17.0
#
# Dependencies Recommended ( Run Time ):
#
#               e11.42.53 sound-theme-freedesktop-0.8
#

#
# Required by:
#
#               e24.36.05 xfce4-notifyd-0.9.7
#               e42.33.24 GSound-1.0.3
#
# Recommended by:
#
#               e23.35.15 xfce4-settings-4.20.1
#               e42.33.21 evolution-data-server-3.54.3
#
# Optionally by:
#
#               e41.42.48 Pipewire-1.2.7
#

export PKG="libcanberra-0.30"
export PKGLOG_DIR=$LFSLOG/42.26
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


patch -Np1 -i ../libcanberra-0.30-wayland-1.patch   \
        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr   \
            --disable-oss   \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make docdir=/usr/share/doc/libcanberra-0.30 install \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
