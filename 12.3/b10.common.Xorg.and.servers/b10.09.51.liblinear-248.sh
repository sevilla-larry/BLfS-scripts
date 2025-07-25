# b10.09.51.liblinear-248.sh
#

#
# Recommended by:
#
#               b10.16.05 Nmap-7.95
#

export PKG="liblinear-248"
export PKGLOG_DIR=$LFSLOG/09.51
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make lib > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Copy Install ..."
echo "3. Copy Install ..." >> $LFSLOG_PROCESS
echo "3. Copy Install ..." >> $PKGLOG_ERROR
install -vm644 linear.h /usr/include			\
		>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm755 liblinear.so.6 /usr/lib			\
		>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
ln -sfv liblinear.so.6 /usr/lib/liblinear.so	\
		>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
