# e43.33.34.gexiv2-0.14.3.sh
#

#
# Dependencies Required:
#
#               xxx.xx.xx Exiv2-0.28.5
#
# Dependencies Recommended:
#
#               e11.13.36 Vala-0.56.17         
#

#
# Required by:
#
#

export PKG="gexiv2-0.14.3"
export PKGLOG_DIR=$LFSLOG/33.34
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr       \
            --buildtype=release \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "***** CONFIGURE FOR TESTS *****" >> $PKGLOG_CONFIG
echo "***** CONFIGURE FOR TESTS *****" >> $PKGLOG_ERROR

echo "4. Meson Configure for Tests ..."
echo "4. Meson Configure for Tests ..." >> $LFSLOG_PROCESS
echo "4. Meson Configure for Tests ..." >> $PKGLOG_ERROR
meson configure -D tests=true   \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "5. Ninja Test ..."
echo "5. Ninja Test ..." >> $LFSLOG_PROCESS
echo "5. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Ninja Install ..."
echo "6. Ninja Install ..." >> $LFSLOG_PROCESS
echo "6. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
