# d10.13.13.LLVM-19.1.7.sh
#

#
# Dependencies Required:
#
#               a.08.9x.01   CMake-3.31.5
#
# Dependencies Optional:
#
#               a.08.93.05   Git-2.48.1
#               a.08.91.08   libxml2-2.13.6
#               b10.13.24.17 psutil-7.0.0
#               b10.13.24.28 PyYAML-6.0.2
#               a.08.91.04   Zip-3.0
#

#
# Required by:
#
#               g12.40.03??? Firefox-128.4.0esr (errata)
#
# Recommended by:
#
#               g12.39.03??? LibreOffice-24.8.0
#
# Recommended ( but needed ) by:
#
#               d20.24.12 Mesa-24.3.4
#

export PKG="llvm-19.1.7.src"
export PKGLOG_DIR=$LFSLOG/13.13
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


tar -xvf ../llvm-cmake-19.1.7.src.tar.xz        \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
tar -xvf ../llvm-third-party-19.1.7.src.tar.xz  \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

sed '/LLVM_COMMON_CMAKE_UTILS/s@../cmake@-cmake-19.1.7.src@'            \
    -i CMakeLists.txt                                                   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed '/LLVM_THIRD_PARTY_DIR/s@../third-party@-third-party-19.1.7.src@'   \
    -i cmake/modules/HandleLLVMOptions.cmake                            \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

tar -xvf ../clang-19.1.7.src.tar.xz -C tools    \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

mv -v tools/clang-19.1.7.src tools/clang        \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

tar -xvf ../compiler-rt-19.1.7.src.tar.xz -C projects       \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
mv -v projects/compiler-rt-19.1.7.src projects/compiler-rt  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

grep -rl '#!.*python' | xargs sed -i '1s/python$/python3/'  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed 's/utility/tool/' -i utils/FileCheck/CMakeLists.txt     \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
CC=gcc CXX=g++                                      \
cmake -D CMAKE_INSTALL_PREFIX=/usr                  \
      -D CMAKE_SKIP_INSTALL_RPATH=ON                \
      -D LLVM_ENABLE_FFI=ON                         \
      -D CMAKE_BUILD_TYPE=Release                   \
      -D LLVM_BUILD_LLVM_DYLIB=ON                   \
      -D LLVM_LINK_LLVM_DYLIB=ON                    \
      -D LLVM_ENABLE_RTTI=ON                        \
      -D LLVM_TARGETS_TO_BUILD="host"               \
      -D LLVM_BINUTILS_INCDIR=/usr/include          \
      -D LLVM_INCLUDE_BENCHMARKS=OFF                \
      -D CLANG_DEFAULT_PIE_ON_LINUX=ON              \
      -D CLANG_CONFIG_FILE_SYSTEM_DIR=/etc/clang    \
      -W no-dev                                     \
      -G Ninja                                      \
      ..                                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -D LLVM_TARGETS_TO_BUILD="host;AMDGPU" \

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# echo "4. Ninja Docs Build ..."
# echo "4. Ninja Docs Build ..." >> $LFSLOG_PROCESS
# echo "4. Ninja Docs Build ..." >> $PKGLOG_ERROR
# ninja docs-clang-html docs-clang-man
#     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -e 's/config.has_no_default_config_flag/True/'      \
    -i ../projects/compiler-rt/test/lit.common.cfg.py   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "4. Ninja Check ..."
echo "4. Ninja Check ..." >> $LFSLOG_PROCESS
echo "4. Ninja Check ..." >> $PKGLOG_ERROR
sh -c 'ulimit -c 0 && ninja check-all'  \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
