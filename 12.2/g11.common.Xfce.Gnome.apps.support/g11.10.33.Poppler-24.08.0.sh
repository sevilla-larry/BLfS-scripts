# g11.10.33.Poppler-24.08.0.sh
#

#
# Recommended ( but needed ) by:
#
#               g12.34.04 Evince-46.3.1
#

export PKG="poppler-24.08.0"
export PKGLOG_DIR=$LFSLOG/10.33
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG
 

mkdir    build
cd       build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_BUILD_TYPE=Release           \
      -D CMAKE_INSTALL_PREFIX=/usr          \
      -D TESTDATADIR=$PWD/testfiles         \
      -D ENABLE_QT5=OFF                     \
      -D ENABLE_UNSTABLE_API_ABI_HEADERS=ON \
      -G Ninja                              \
      ..                                    \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3.1 Git some Test ..."
echo "3.1 Git some Test ..." >> $LFSLOG_PROCESS
echo "3.1 Git some Test ..." >> $PKGLOG_ERROR
 git clone --depth 1    \
        https://gitlab.freedesktop.org/poppler/test.git \
        testfiles       \
      > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "3.2 Ninja Test ..."
echo "3.2 Ninja Test ..." >> $LFSLOG_PROCESS
echo "3.2 Ninja Test ..." >> $PKGLOG_ERROR
LC_ALL=en_US.UTF-8 ninja test   \
      > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Ninja Build ..."
echo "4. Ninja Build ..." >> $LFSLOG_PROCESS
echo "4. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m755 -d           /usr/share/doc/poppler-24.08.0    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -vr ../glib/reference/html /usr/share/doc/poppler-24.08.0    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "6.1. Extract Encoding Data tar ..."
echo "6.1. Extract Encoding Data tar ..." >> $LFSLOG_PROCESS
echo "6.1. Extract Encoding Data tar ..." >> $PKGLOG_ERROR
tar -vxf ../../poppler-data-0.4.12.tar.gz   \
        >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

cd poppler-data-0.4.12

echo "6.2. Install Encoding Data ..."
echo "6.2. Install Encoding Data ..." >> $LFSLOG_PROCESS
echo "6.2. Install Encoding Data ..." >> $PKGLOG_ERROR
make prefix=/usr install    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
