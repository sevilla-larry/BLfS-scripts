# b10.09.24.icu-75.1.sh
#

#
# Recommended by:
#
#               b10.09.72 libxml2-2.13.3
#               d10.10.12.HarfBuzz-9.0.0
#               g12.40.03 Firefox-128.3.1esr
#               e12.25.42 Qt-6.7.2
#
# Optionally by:
#
#               c11.09.07 boost-1.86.0
#
# Optional ( but needed during compile by ):
#
#               c12.22.04 PostgreSQL-16.4
#

export PKG="icu4c-75_1-src"
export PKGLOG_DIR=$LFSLOG/09.24
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tgz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
#cd $PKG
# directory NOT conventional
cd icu


cd source

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr   \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cd ..


cd ..
#rm -rf $PKG
# directory NOT conventional
rm -rf icu
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
