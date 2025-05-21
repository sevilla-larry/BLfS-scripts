# d20.24.28.04.DejaVu-fonts-ttf-2.37.sh
#

#
# Required at Runtime by:
#
#               d20.24.23 xterm-397
#				e11.25.16 GTK-3.24.48
#

export PKG="dejavu-fonts-ttf-2.37"
export PKGLOG_DIR=$LFSLOG/24.28.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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


install -v -d -m755 /usr/share/fonts/dejavu             > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 ttf/*.ttf /usr/share/fonts/dejavu     >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
fc-cache -v /usr/share/fonts/dejavu                    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
#PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
