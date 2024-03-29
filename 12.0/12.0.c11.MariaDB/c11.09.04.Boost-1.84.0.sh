# b.09.04.Boost-1.84.0.sh
# svn due to errata in MariaDB
#

export PKG="boost-1.84.0"
export PKGLOG_DIR=$LFSLOG/09.04
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. BootStrap ..."
echo "2. BootStrap ..." >> $LFSLOG_PROCESS
echo "2. BootStrap ..." >> $PKGLOG_ERROR
./bootstrap.sh --prefix=/usr --with-python=python3  \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. B2 Build ..."
echo "3. B2 Build ..." >> $LFSLOG_PROCESS
echo "3. B2 Build ..." >> $PKGLOG_ERROR
./b2 stage $MAKEFLAGS threading=multi link=shared   \
         > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Regression Tests ..."
echo "4. Regression Tests ..." >> $LFSLOG_PROCESS
echo "4. Regression Tests ..." >> $PKGLOG_ERROR
pushd tools/build/test
    python3 test_all.py   \
         > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
popd

echo "5. Library Regression Tests ..."
echo "5. Library Regression Tests ..." >> $LFSLOG_PROCESS
echo "5. Library Regression Tests ..." >> $PKGLOG_ERROR
pushd status
    ../b2 $MAKEFLAGS  \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
popd

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
./b2 install threading=multi link=shared  \
         > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
