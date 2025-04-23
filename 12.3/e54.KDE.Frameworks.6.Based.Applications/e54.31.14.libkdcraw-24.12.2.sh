# e54.31.14.libkdcraw-24.12.2.sh
#
#
# Dependencies Required:
#
#               xxx.xx.xx libraw-0.21.3
#               xxx.xx.xx KDE Frameworks-6.11.0
#
# Dependencies Recommended:
#
#               xxx.xx.xx libkexiv2-24.12.2
#               xxx.xx.xx libtiff-4.7.0
#               xxx.xx.xx phonon-4.12.0
#               xxx.xx.xx Poppler-25.02.0 (built with Qt6, required for PDF support)
#
# Dependencies Optional:
#
#               xxx.xx.xx qca-2.3.9
#               xxx.xx.xx discount
#               xxx.xx.xx DjVuLibre 
#               xxx.xx.xx libspectre 
#               xxx.xx.xx libepub
#               xxx.xx.xx LibZip
#
# Required by:
#               xxx.xx.xx xxxxx
#


export PKG="libkcraw-24.12.2"
export PKGLOG_DIR=$LFSLOG/31.14
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build
 

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=$KF6_PREFIX \
      -D CMAKE_BUILD_TYPE=Release         \
      -D BUILD_TESTING=OFF                \
      -D QT_MAJOR_VERSION=6               \
      -W no-dev                           \
      ..                                  \
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
