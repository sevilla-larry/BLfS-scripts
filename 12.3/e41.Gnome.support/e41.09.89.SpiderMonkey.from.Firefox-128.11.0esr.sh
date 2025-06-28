# e41.09.89.SpiderMonkey.from.Firefox-128.11.0esr.sh
# (errata)
#

#
# Dependencies Required:
#
#               e10.13.02  Cbindgen-0.28.0
#               a.08.91.07 icu-76.1
#               a.08.91.03 Which-2.23
#
# Dependencies Recommended:
#
#               d10.13.13  LLVM-19.1.7
#

#
# Required by:
#
#               e42.33.10 Gjs-1.82.1
#

export PKG="firefox-128.11.0"
export PKG0=$PKG"esr.source"
export PKGLOG_DIR=$LFSLOG/40.03
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
tar xvf $PKG0.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i 's/icu-i18n/icu-uc &/' js/moz.configure  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir obj
cd    obj

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../js/src/configure --prefix=/usr           \
                    --disable-debug-symbols \
                    --disable-jemalloc      \
                    --enable-readline       \
                    --enable-rust-simd      \
                    --with-intl-api         \
                    --with-system-icu       \
                    --with-system-zlib      \
                    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

case "$PYVER" in
    11)
        # do nothing
        ;;
    12)
        # do nothing
        ;;
    13)
        sed 's/pipes/shlex/'                    \
            -i ../js/src/tests/lib/results.py   \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
        ;;
    *)
		echo "Error: PYVER must be 11, 12 or 13"
		echo "Error: PYVER must be 11, 12 or 13" >> $LFSLOG_PROCESS
        ;;
esac

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make -C js/src check-jstests                            \
     JSTESTS_EXTRA_ARGS="--timeout 300 --wpt=disabled"  \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
make -C js/src check-jit-test JITTEST_EXTRA_ARGS=-j1    \
     >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -v /usr/lib/libjs_static.ajs \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -i '/@NSPR_CFLAGS@/d'       \
    /usr/bin/js128-config       \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
unset PKG0
