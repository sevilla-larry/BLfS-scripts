# d20.25.44.Vulkan-Loader-1.4.304.sh
#

#
# Dependencies Required:
#
#               a.08.9x.?1 CMake-3.31.5
#               d20.25.43  Vulkan-Headers-1.4.304
#               d20.24.08  Xorg Libraries
#
# Dependencies Recommended:
#
#               d10.09.97 Wayland-1.23.0
#
# Dependencies Recommended (Runtime):
#
#               d20.24.12 Mesa-24.3.4
#
# Dependencies Optional (for testing):
#
#               a.08.93.05 Git-2.48.1
#               a.08.91.40 make-ca-1.16
#

#
# Recommended by:
#
#               d20.24.12 Mesa-24.3.4
#

export PKG="Vulkan-Loader-1.4.304"
export PKGLOG_DIR=$LFSLOG/25.44
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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


mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr      \
      -D CMAKE_BUILD_TYPE=Release       \
      -D CMAKE_SKIP_INSTALL_RPATH=ON    \
      -G Ninja                          \
      ..                                \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4.1 Ninja Test Configure ..."
echo "4.1 Ninja Test Configure ..." >> $LFSLOG_PROCESS
echo "4.1 Ninja Test Configure ..." >> $PKGLOG_ERROR
echo "4.1 Ninja Test Configure ..." >> $PKGLOG_CONFIG
sed "s/'git', 'clone'/&, '--depth=1', '-b', self.commit/"   \
    -i ../scripts/update_deps.py                            \
    >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
cmake -D BUILD_TESTS=ON \
      -D UPDATE_DEPS=ON \
      ..                \
    >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "4.2. Ninja Test Build ..."
echo "4.2. Ninja Test Build ..." >> $LFSLOG_PROCESS
echo "4.2. Ninja Test Build ..." >> $PKGLOG_ERROR
echo "4.2. Ninja Test Build ..." >> $PKGLOG_BUILD
ninja >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4.3 Ninja Test ..."
echo "4.3 Ninja Test ..." >> $LFSLOG_PROCESS
echo "4.3 Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
