# e23.35.03.libxfce4ui-4.20.0.sh
#

#
# Dependencies Required:
#
#               e21.25.16 GTK-3.24.48
#               e23.35.02 Xfconf-4.20.0
#
# Dependencies Recommended:
#
#               e21.25.42 startup-notification-0.12
#
# Dependencies optional:
#
#               e10.09.45 libgudev-238
#

#
# Required by:
#
#               e23.35.04 Exo-4.20.0
#               e23.35.05 Garcon-4.20.0
#               e23.35.17 Xfwm4-4.20.0
#               e23.35.18 xfce4-session-4.20.0
#               e24.36.02 xfce4-terminal-1.1.4
#               e24.36.04 Ristretto-0.13.3
#               e24.36.05 xfce4-notifyd-0.9.7
#

export PKG="libxfce4ui-4.20.0"
export PKGLOG_DIR=$LFSLOG/35.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

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

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
