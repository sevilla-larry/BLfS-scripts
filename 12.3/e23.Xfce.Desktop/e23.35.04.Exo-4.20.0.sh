# e23.35.04.Exo-4.20.0.sh
#

#
# Dependencies Required:
#
#               e21.25.16 GTK-3.24.48
#               e23.35.03 libxfce4ui-4.20.0
#               e23.35.01 libxfce4util-4.20.0
#

#
# Required by:
#
#               e23.35.09 xfce4-panel-4.20.3
#               e23.35.10 thunar-4.20.2
#               e23.35.11 thunar-volman-4.20.0
#               e23.35.15 xfce4-settings-4.20.1
#               e23.35.16 Xfdesktop-4.20.1
#               f22.26.02 lightdm-1.32.0        ???
#

export PKG="exo-4.20.0"
export PKGLOG_DIR=$LFSLOG/35.04
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
./configure --prefix=/usr       \
            --sysconfdir=/etc   \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

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


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
