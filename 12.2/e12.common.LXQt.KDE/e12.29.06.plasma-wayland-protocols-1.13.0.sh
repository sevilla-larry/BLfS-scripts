# e12.29.06.plasma-wayland-protocols-1.13.0.sh
#

#
# Dependencies Required:
#
#               e12.29.02 extra-cmake-modules-6.5.0
#

#
# Required by:
#
#               e32.37.02 kwindowsystem-6.5.0 for lxqt
#               e32.37.05 kidletime-6.5.0 for lxqt
#               e32.37.06 kwayland-6.1.4 for lxqt
#               e32.37.07 libkscreen-6.1.4 for lxqt
#

export PKG="plasma-wayland-protocols-1.13.0"
export PKGLOG_DIR=$LFSLOG/29.06
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

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
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_CONFIG
#PKGLOG_BUILD
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
