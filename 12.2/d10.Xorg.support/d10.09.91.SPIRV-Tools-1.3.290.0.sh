# d10.09.91.SPIRV-Tools-1.3.290.0.sh
#

#
# Dependencies Required:
#
#               b11.13.03 CMake-3.30.2
#               d10.09.90 SPIRV-Headers-1.3.290.0
#

#
# Required by:
#
#               d10.25.12 Glslang-14.3.0
#

export PKG="SPIRV-Tools-1.3.290.0"
export PKGLOG_DIR=$LFSLOG/09.91
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
#cd $PKG
cd SPIRV-Tools-vulkan-sdk-1.3.290.0


mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr      \
      -D CMAKE_BUILD_TYPE=Release       \
      -D SPIRV_WERROR=OFF               \
      -D BUILD_SHARED_LIBS=ON           \
      -D SPIRV_TOOLS_BUILD_STATIC=OFF   \
      -D SPIRV-Headers_SOURCE_DIR=/usr  \
      -G Ninja                          \
      ..                                \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf SPIRV-Tools-vulkan-sdk-1.3.290.0
#rm -rf $PKG
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
