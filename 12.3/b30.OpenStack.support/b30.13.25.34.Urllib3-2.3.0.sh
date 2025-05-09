# b30.13.25.34.Urllib3-2.3.0.sh
#

#
# Dependencies Required:
#
#               b10.13.24.09 Hatchling-1.25.0
#
#
# Dependencies Optional:
#
#               b10.13.23.26 Pytest-8.3.2
#

#
# Required by:
#
#               b30.13.23.30 Requests-2.32.3
#

export PKG="urllib3-2.3.0"
export PKGLOG_DIR=$LFSLOG/13.25.34
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

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
                urllib3                 \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "4. pyTest ..."
echo "4. pyTest ..." >> $LFSLOG_PROCESS
echo "4. pyTest ..." >> $PKGLOG_ERROR
python3 -m venv --system-site-packages testenv  \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
source testenv/bin/activate                     \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
pip3 install trustme         \
             tornado         \
             python-dateutil \
             mock            \
             pysocks         \
             pytest-timeout  \
             trio            \
             hypercorn       \
             quart           \
             quart_trio      \
             httpx           \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
python3 /usr/bin/pytest      \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
deactivate  >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR

# A few errors are known to occur.


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
