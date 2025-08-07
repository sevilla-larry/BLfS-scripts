# e11.13.02.Cbindgen-0.28.0.sh
#

#
# Dependencies Required:
#
#               e11.13.27 Rustc-1.85.0
#

#
# Required by:
#
#               g22.40.03 Firefox-140.1.0esr					(errata)
#				e41.09.89 SpiderMonkey.from.Firefox-128.13.0esr	(errata)
#

export PKG="cbindgen-0.28.0"
export PKGLOG_DIR=$LFSLOG/13.02
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

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
install -v -Dm755 target/release/cbindgen	\
			/usr/bin/						\
			> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
