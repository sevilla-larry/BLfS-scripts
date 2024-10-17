# c.37.10.lxde-common-0.99.2.sh
#
# Dependencies Required:
#
#               28.09 lxde-icon-theme-0.5.1
#               37.07 LXPanel-0.10.1
#               37.09 LXSession-0.5.5
#               37.05 PCManFM-1.3.2
#
# Dependencies Required Runtime:
#
#               27.03 openbox-3.6.1
#
# Dependencies Recommended:
#
#               11.04 desktop-file-utils-0.26
#               11.17 shared-mime-info-2.2
#               28.07 hicolor-icon-theme-0.17
#

export PKG="lxde-common-0.99.2"
export PKGLOG_DIR=$LFSLOG/37.10
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
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

update-mime-database /usr/share/mime
gtk-update-icon-cache -qf /usr/share/icons/hicolor
update-desktop-database -q


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
