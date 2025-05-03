# d10.10.11.Graphite2-1.3.14.Pass2.sh
#

#
# Dependencies Required:
#
#               a.08.9x.?1 CMake-3.31.5
#
# Dependencies Optional:
#
#               d10.10.04 FreeType-2.13.3 (Pass 1)
#               d10.10.12 harfBuzz-10.4.0
#

export PKG="Graphite2-1.3.14"
export PKGLOG_DIR=$LFSLOG/10.11.2
#export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

#echo "1. Extract tar..."
#echo "1. Extract tar..." >> $LFSLOG_PROCESS
#echo "1. Extract tar..." >> $PKGLOG_ERROR
#tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


#sed -i '/cmptest/d' tests/CMakeLists.txt    \
#        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "1. Build Clean ..."
echo "1. Build Clean ..." >> $LFSLOG_PROCESS
echo "1. Build Clean ..." >> $PKGLOG_ERROR
rm -rf  build
mkdir   build
cd      build

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr          \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make        > $PKGLOG_BUILD 2>> $PKGLOG_ERROR
$make docs  >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
