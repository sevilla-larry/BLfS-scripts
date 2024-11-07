# g11.10.10.GLM-1.0.1.sh
#

#
# Recommended by:
#
#               g12.39.03 LibreOffice-24.8.0
#

export PKG="glm-1.0.1"
export PKGLOG_DIR=$LFSLOG/10.10
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Copy files ..."
echo "2. Copy files ..." >> $LFSLOG_PROCESS
echo "2. Copy files ..." >> $PKGLOG_ERROR

cp -vr glm /usr/include/			\
	>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -vr doc /usr/share/doc/glm-1.0.1	\
	>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
