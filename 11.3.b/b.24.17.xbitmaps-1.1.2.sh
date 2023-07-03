# b.24.17.xbitmaps-1.1.2.sh
#
# Dependencies Required:
#
#       24.02 util-macros-1.20.0
#

export PKG="xbitmaps-1.1.2"
export PKGLOG_DIR=$LFSLOG/24.17
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure $XORG_CONFIG    \
     > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_CONFIG
# PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
