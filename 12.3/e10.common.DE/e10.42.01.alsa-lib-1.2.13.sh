# e10.42.01.alsa-lib-1.2.13.sh
#

#
# Dependencies Recommended (Runtime):
#
#               d10.12.12 elogind-255.17
#

#
# Required by:
#
#				e43.33.38 gnome-settings-daemon-47.2
#
# Required (hidden) by:
#
#               g22.40.03 Firefox-128.7.0esr
#
# Recommended by:
#
#				e11.42.26 libcanberra-0.30
#               e10.42.49 PulseAudio-17.0
#               e10.44.01 FFmpeg-7.1
#               e41.42.14 gst-plugins-base-1.26.3   (errata)
#               e41.42.57 v4l-utils-1.28.1
#               e12.25.40 Qt-6.9.1				(errata/svn)
#
# Optionally by:
#
#               e10.42.40 libsndfile-1.2.2
#               e10.42.52 SDL2-2.30.11
#               e41.42.48 Pipewire-1.2.7
#

#
# Kernel config
#
#   Device Drivers --->
#     <*/M> Sound card support --->                                          [SOUND]
#       # Select settings and drivers appropriate for your hardware
#       # in the submenu:
#       <*/M> Advanced Linux Sound Architecture --->                           [SND]
#

export PKG="alsa-lib-1.2.13"
export PKGLOG_DIR=$LFSLOG/42.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

tar -C /usr/share/alsa --strip-components=1 -xvf ../alsa-ucm-conf-1.2.13.tar.bz2	\
			>> $PKGLOG_TAR 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
