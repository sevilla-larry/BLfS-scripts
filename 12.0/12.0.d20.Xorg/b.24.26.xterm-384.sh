# b.24.26.xterm-384.sh
#
# Dependencies Required:
#
#               24.18 Xorg Applications
#
# Dependencies Required Runtime:
#
#               24.31.04 Dejavu-fonts-ttf-2.37
#
#
# Runtime Recommended by:
#
#               24.28 xinit-1.4.2
#

export PKG="xterm-384"
export PKGLOG_DIR=$LFSLOG/24.26
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tgz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i '/v0/{n;s/new:/new:kb=^?:/}' termcap
printf '\tkbs=\\177,\n' >> terminfo

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
TERMINFO=/usr/share/terminfo                      \
./configure $XORG_CONFIG                          \
     --with-app-defaults=/etc/X11/app-defaults    \
     > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install         > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make install-ti     >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -p /usr/share/applications
cp *.desktop /usr/share/applications/


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
