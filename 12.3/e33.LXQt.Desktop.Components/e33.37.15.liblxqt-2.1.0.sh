# e33.37.15.liblxqt-2.1.0.sh
#

#
# Dependencies Required:
#
#               e33.37.11 libqtxdg-4.0.0
#               e32.37.02 kwindowsystem-6.5.0 for lxqt
#               e12.29.05 Polkit-Qt-0.200.0
#

#
# Required by:
#
#               e33.37.19 lxqt-globalkeys-2.0.0
#               e33.37.21 lxqt-qtplugin-2.0.0
#               e33.37.22 lxqt-panel-2.0.1
#               e33.37.23 pcmanfm-qt-2.0.0
#               e33.37.27 lxqt-admin-2.0.0
#               e33.37.28 lxqt-about-2.0.0
#               e33.37.29 lxqt-config-2.0.0
#               e33.37.30 lxqt-policykit-2.0.0
#               e33.37.31 lxqt-sudo-2.0.0
#               e33.37.32 lxqt-openssh-askpass-2.0.1
#               e33.37.33 lxqt-session-2.0.0
#

export PKG="liblxqt-2.1.0"
export PKGLOG_DIR=$LFSLOG/37.15
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D CMAKE_BUILD_TYPE=Release   \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
