# g11.09.08.brotli-1.1.0.sh
#

#
# Dependencies Required:
#
#               b10.13.03 CMake-3.30.2
#

#
# Recommended by:
#
#               g11.09.80 Node.js-20.18.0 (svn)
#
# Optionally by:
#
#               e10.04.07 GnuTLS-3.8.7.1
#

export PKG="brotli-1.1.0"
export PKGLOG_DIR=$LFSLOG/09.08
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG
 

mkdir    build
cd       build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D CMAKE_BUILD_TYPE=Release   \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR 
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR 
make test > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cd ..
sed "/c\/.*\.[ch]'/d;\
     /include_dirs=\[/\
     i libraries=['brotlicommon','brotlidec','brotlienc']," \
    -i setup.py \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "6. pip3 wheel Build ..."
echo "6. pip3 wheel Build ..." >> $LFSLOG_PROCESS
echo "6. pip3 wheel Build ..." >> $PKGLOG_ERROR
pip3 wheel  -w dist                 \
            --no-build-isolation    \
            --no-deps               \
            --no-cache-dir          \
            $PWD                    \
            >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "7. pip3 Install ..."
echo "7. pip3 Install ..." >> $LFSLOG_PROCESS
echo "7. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --find-links=dist       \
                --no-cache-dir          \
                --no-user               \
                Brotli                  \
                >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# NO pytest


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
