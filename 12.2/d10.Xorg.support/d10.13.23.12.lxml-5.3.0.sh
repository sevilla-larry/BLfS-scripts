# d10.13.23.12.lxml-5.3.0.sh
#

#
# Dependencies Required:
#
#               b10.09.74 libxslt-1.1.42
#

#
# Recommended by:
#
#               g12.39.03 LibreOffice-24.8.0
#
# Optional by:
#
#               d10.12.11 elogind-255.5
#

export PKG="lxml-5.3.0"
export PKGLOG_DIR=$LFSLOG/13.23.12
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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


echo "2. pip3 wheel Build ..."
echo "2. pip3 wheel Build ..." >> $LFSLOG_PROCESS
echo "2. pip3 wheel Build ..." >> $PKGLOG_ERROR
pip3 wheel  -w dist                 \
            --no-build-isolation    \
            --no-deps               \
            --no-cache-dir          \
            $PWD                    \
            > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. pip3 Install ..."
echo "3. pip3 Install ..." >> $LFSLOG_PROCESS
echo "3. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --find-links=dist       \
                --no-cache-dir          \
                --no-user               \
                lxml                    \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
# PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG