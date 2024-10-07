# d20.24.32.09.Noto-fonts-ttf-v20201206-phase3.sh
# Noto fonts is the default of fontconfig-2.14
#
##### Note: NOT yet installed
#

#
# Required at Runtime by:
#
#               d20.24.27 xterm-393
#

export PKG="noto-fonts-20201206-phase3"
export PKGLOG_DIR=$LFSLOG/24.31.09
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
#tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
tar xvf v20201206-phase3.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


install -v -d -m755 /usr/share/fonts/noto                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 hinted/ttf/*.ttf /usr/share/fonts/noto >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
fc-cache -v /usr/share/fonts/noto                       >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
#PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
