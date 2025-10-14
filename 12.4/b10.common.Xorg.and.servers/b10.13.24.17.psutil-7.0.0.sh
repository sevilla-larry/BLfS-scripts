# b10.13.24.17.psutil-7.0.0.sh
#

#
# Dependencies Optional:
#
#               a.08.91.20.10 Pytest-8.4.1
#

#
# Required by:
#
#               i4.2.14 openstacksdk-4.4.0
#               i4.1.44 oslo.reports-3.5.1
#               i4.1.49 oslo.utils-8.2.0
#               i090.9.11 os_brick-6.9.1
#
# Optionally (for tests) by:
#
#               d10.13.13 LLVM-20.1.8
#

export PKG="psutil-7.0.0"
export PKGLOG_DIR=$LFSLOG/13.24.17
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
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


echo "2. pip3 Build ..."
echo "2. pip3 Build ..." >> $LFSLOG_PROCESS
echo "2. pip3 Build ..." >> $PKGLOG_ERROR
pip3 wheel  -w dist                 \
            --no-cache-dir          \
            --no-build-isolation    \
            --no-deps               \
            $PWD                    \
            > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. pip3 Install ..."
echo "3. pip3 Install ..." >> $LFSLOG_PROCESS
echo "3. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --no-user               \
                --find-links dist       \
                --no-cache-dir          \
                psutil                  \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# Test hangs
#echo "4. Make Test ..."
#echo "4. Make Test ..." >> $LFSLOG_PROCESS
#echo "4. Make Test ..." >> $PKGLOG_ERROR
#make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

# test_disk_usage & est_net_if_addrs are know to fail
# test_io_counters is known to fail if
#   kernel CONFIG_TASK_IO_ACCOUNTING is NOT enabled


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
