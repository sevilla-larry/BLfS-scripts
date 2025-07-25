# e10.42.45.libvpx-1.15.2.sh
# (errata)
#

#
# Dependencies Recommended:
#
#               e10.13.38  yasm-1.3.0
#           or  e10.13.17  NASM-2.16.03
#               a.08.91.03 Which-2.23
#
# Dependencies Optional:
#
#               a.08.93.04 cURL-8.14.1  (errata)
#               a.08.91.40 make-ca-1.16 (errata)
#

#
# Recommended by:
#
#               e10.44.01 FFmpeg-7.1
#               g22.40.03 Firefox-128.11.0esr   (errata)
#

export PKG="libvpx-1.15.2"
export PKGLOG_DIR=$LFSLOG/42.45
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i 's/cp -p/cp/' build/make/Makefile    \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir libvpx-build
cd    libvpx-build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure --prefix=/usr      \
             --enable-shared    \
             --disable-static   \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
# -j1 due to test uses swap space intensively
LD_LIBRARY_PATH=. make -j1 test \
            > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
