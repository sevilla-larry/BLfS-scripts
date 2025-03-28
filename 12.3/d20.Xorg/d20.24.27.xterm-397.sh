# d20.24.27.xterm-397.sh
#

#
# Dependencies Required:
#
#               d20.24.18 Xorg Applications
#
# Dependencies Required Runtime:
#
#               d20.24.32.04 Dejavu-fonts-ttf-2.37
#

#
# Runtime Recommended by:
#
#               d20.24.29 xinit-1.4.2
#

export PKG="xterm-397"
export PKGLOG_DIR=$LFSLOG/24.27
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tgz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i '/v0/{n;s/new:/new:kb=^?:/}' termcap     \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
printf '\tkbs=\\177,\n' >> terminfo 2>> $PKGLOG_ERROR

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

#make install-ti     >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -pv /usr/share/applications           \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v *.desktop /usr/share/applications/    \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cat >> /etc/X11/app-defaults/XTerm << "EOF" 2>> $PKGLOG_ERROR
*VT100*locale: true
*VT100*faceName: Monospace
*VT100*faceSize: 10
*backarrowKeyIsErase: true
*ptyInitialErase: true
EOF


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
