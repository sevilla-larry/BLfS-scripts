# e11.13.01.Cbindgen-0.27.0.sh
#

#
# Dependencies Required:
#
#               e11.13.26 Rustc-1.80.1

#
# Required by:
#
#               g12.40.03 Firefox-128.3.1esr
#

export PKG="cbindgen-0.27.0"
export PKGLOG_DIR=$LFSLOG/13.01
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Cargo Build ..."
echo "2. Cargo Build ..." >> $LFSLOG_PROCESS
echo "2. Cargo Build ..." >> $PKGLOG_ERROR
cargo build --release	\
	> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Cargo Test ..."
echo "3. Cargo Test ..." >> $LFSLOG_PROCESS
echo "3. Cargo Test ..." >> $PKGLOG_ERROR
cargo test --release	\
	> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Cargo Install ..."
echo "4. Cargo Install ..." >> $LFSLOG_PROCESS
echo "4. Cargo Install ..." >> $PKGLOG_ERROR
install -Dm755 target/release/cbindgen /usr/bin/	\
	> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
