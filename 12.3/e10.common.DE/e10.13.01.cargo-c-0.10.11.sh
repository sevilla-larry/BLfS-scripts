# e10.13.01.cargo-c-0.10.11.sh
#

#
# Dependencies Required:
#
#               e10.13.27  Rustc-1.85.0
#               a.08.93.04 cURL-8.12.1
#               a.08.91.40 make-ca-1.16
#
# Dependencies Recommended:
#
#               a.08.91.68 libssh2-1.11.1
#               a.08.91.18 SQLite-3.49.1
#

#
# Required by:
#
#               e11.10.24 librsvg-2.59.2
#               e10.13.02 Cbindgen-0.28.0
#

export PKG="cargo-c-0.10.11"
export PKGLOG_DIR=$LFSLOG/13.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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


curl -LO https://github.com/lu-zero/cargo-c/releases/download/v0.10.11/Cargo.lock   \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Cargo Build ..."
echo "2. Cargo Build ..." >> $LFSLOG_PROCESS
echo "2. Cargo Build ..." >> $PKGLOG_ERROR
[ ! -e /usr/include/libssh2.h ] || export LIBSSH2_SYS_USE_PKG_CONFIG=1
[ ! -e /usr/include/sqlite3.h ] || export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
cargo build --release > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Cargo Test ..."
echo "4. Cargo Test ..." >> $LFSLOG_PROCESS
echo "4. Cargo Test ..." >> $PKGLOG_ERROR
cargo test --release > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Install ..."
echo "5. Install ..." >> $LFSLOG_PROCESS
echo "5. Install ..." >> $PKGLOG_ERROR
install -vm755 target/release/cargo-{capi,cbuild,cinstall,ctest}    \
        /usr/bin/                                                   \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
