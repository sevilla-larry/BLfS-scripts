# e31.28.02.breeze-icons-6.11.0.sh
#

#
# Dependencies Required:
#
#               e12.29.02 extra-cmake-modules-6.11.0
#               e12.25.40 Qt-6.9.1          (errata/svn)
#
# Dependencies Optional:
#
#           ??? Building KDE Frameworks 6.11.0
#               a.08.91.08 libxml2-2.14.3   (errata)
#               d10.13.24.12 lxml-5.3.1
#

#
# Recommended by:
#
#               e33.37.40 LXQt Desktop Final Instructions
#

export PKG="breeze-icons-6.11.0"
export PKGLOG_DIR=$LFSLOG/28.02
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

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
cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D BUILD_TESTING=OFF          \
      -W no-dev                     \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

#echo "3. Make Build ..."
#echo "3. Make Build ..." >> $LFSLOG_PROCESS
#echo "3. Make Build ..." >> $PKGLOG_ERROR
#make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
