# b.24.31.04.dejavu-fonts-ttf-2.37.sh
#
# Required at Runtime by:
#
#    24.26 xterm-379
#

export PKG="dejavu-fonts-ttf-2.37"
export PKGLOG_DIR=$LFSLOG/24.31.04
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
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


install -v -d -m755 /usr/share/fonts/dejavu             > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 ttf/*.ttf /usr/share/fonts/dejavu     >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
fc-cache -v /usr/share/fonts/dejavu                    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
#PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
