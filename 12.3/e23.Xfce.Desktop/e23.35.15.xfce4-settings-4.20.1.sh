# e23.35.15.xfce4-settings-4.20.1.sh
#

#
# Dependencies Required:
#
#               e23.35.04 Exo-4.20.0
#               e23.35.05 Garcon-4.20.0
#
# Dependencies Required (runtime):
#
#               e11.28.09 lxde-icon-theme-0.5.1
#
# Dependencies Recommended:
#
#               e11.42.26 libcanberra-0.30
#               e21.25.35 libnotify-0.8.4
#               e11.25.36 libxklavier-5.4
#
# Dependencies Optional:
#
#               d20.24.21.3 libinput-1.27.1
#               e10.12.37   UPower-1.90.7
#

export PKG="xfce4-settings-4.20.1"
export PKGLOG_DIR=$LFSLOG/35.15
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
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


if	 [ "$WITH_SOUND" -eq 1 ]; then
 	export SOUND_PARAMETER="--enable-sound-settings"
else
    export SOUND_PARAMETER=""
fi

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            --sysconfdir=/etc   \
            $SOUND_PARAMETER    \
            --enable-pluggable-dialogs  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#           possible need libcanberra-0.30
#           --enable-sound-settings: Use this switch to enable sound settings in GUI.
#           --enable-pluggable-dialogs: Use this switch to enable support for embedded settings dialogs.

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

unset SOUND_PARAMETER


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
