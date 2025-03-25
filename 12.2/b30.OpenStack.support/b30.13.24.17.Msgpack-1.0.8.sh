# b30.13.24.17.Msgpack-1.0.8.sh
#

#
# Dependencies Required:
#
#               b30.13.23.04 Cython-3.0.11
#               b10.13.24.22 Setuptools_scm-8.1.0
#
# Dependencies Optional:
#
#               b10.13.23.26 Pytest-8.3.2
#

#
# Required by:
#
#               i030.9.04 oslo.serialization-5.5.0
#               i080.9.13 oslo.privsep-3.4.0
#               i151.9.1  KeyStone-26.0.0
#

export PKG="msgpack-1.0.8"
export PKGLOG_DIR=$LFSLOG/13.24.17
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
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
                msgpack                 \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "4. pyTest ..."
echo "4. pyTest ..." >> $LFSLOG_PROCESS
echo "4. pyTest ..." >> $PKGLOG_ERROR
pytest >  $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
