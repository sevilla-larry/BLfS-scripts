# b30.13.24.02.Attrs-24.2.0.sh
#

#
# Dependencies Required:
#
#               b10.13.24.09 Hatchling-1.25.0
#               b30.13.24.10 Hatch-Fancy-Pypi-Readme-24.1.0
#
# Dependencies Optional:
#
#               b10.13.23.26 Pytest-8.3.2
#

#
# Required by:
#
#               i010.9.07 cmd2-2.4.3
#               i010.9.22 referencing-0.32.1                    
#               i010.9.24 jsonschema-4.23.0
#               
#

export PKG="attrs-24.2.0"
export PKGLOG_DIR=$LFSLOG/13.24.02
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
                attrs                   \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "4. pyTest ..."
echo "4. pyTest ..." >> $LFSLOG_PROCESS
echo "4. pyTest ..." >> $PKGLOG_ERROR
python3 -m venv --system-site-packages testenv              \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
testenv/bin/pip3 install 'attrs[tests]'                     \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
PATH=$PWD/testenv/bin:$PATH testenv/bin/python -m pytest    \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
