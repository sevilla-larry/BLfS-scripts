# e41.11.06.glslc.from.shaderc-2024.4.sh
# for PCs with CPU/iGPU Intel 4th Gen & up
#

#
# Dependencies Required:
#
#               a.08.9x.?1 CMake-3.31.5
#               d20.25.12  Glslang-15.1.0
#               d20.09.91  SPIRV-Tools-1.4.304.1
#

#
# Recommended by:
#
#               e41.25.17 GTK-4.16.12
#
# Optionally by:
#
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
#

export PKG="shaderc-2024.4"
export PKGLOG_DIR=$LFSLOG/11.06
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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


sed '/build-version/d'                  \
    -i glslc/CMakeLists.txt             \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed '/third_party/d'                    \
    -i CMakeLists.txt                   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed 's|SPIRV|glslang/&|'                \
    -i libshaderc_util/src/compiler.cc  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo '"2024.4"'                         \
     > glslc/src/build-version.inc      \
     2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D CMAKE_BUILD_TYPE=Release   \
      -D SHADERC_SKIP_TESTS=ON      \
      -G Ninja                      \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
install -vm755 glslc/glslc /usr/bin \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
