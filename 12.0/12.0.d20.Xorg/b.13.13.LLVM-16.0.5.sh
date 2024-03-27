# b.13.13.LLVM-16.0.5.sh
#
# Dependencies Required:
#
#               13.04 CMake-3.27.2
#
# Dependencies Optional:
#
#               09.68 libxml2-2.10-4
#
#
# Recommended ( but needed ) by:
#
#               24.16 Mesa-23.1.6 ( PC )
#

export PKG="llvm-16.0.5.src"
export PKGLOG_DIR=$LFSLOG/13.13
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


tar -xvf ../llvm-cmake.src.tar.xz       \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
tar -xvf ../llvm-third-party.src.tar.xz \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

sed '/LLVM_COMMON_CMAKE_UTILS/s@../cmake@llvm-cmake.src@'          \
    -i CMakeLists.txt
sed '/LLVM_THIRD_PARTY_DIR/s@../third-party@llvm-third-party.src@' \
    -i cmake/modules/HandleLLVMOptions.cmake

tar -xvf ../clang-16.0.5.src.tar.xz -C tools  \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

mv tools/clang-16.0.5.src tools/clang

tar -xvf ../compiler-rt-16.0.5.src.tar.xz -C projects \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

mv projects/compiler-rt-16.0.5.src projects/compiler-rt

grep -rl '#!.*python' | xargs sed -i '1s/python$/python3/'

patch -Np2 -d tools/clang <../clang-16.0.5-enable_default_ssp-1.patch

sed 's/clang_dfsan/& -fno-stack-protector/' \
    -i projects/compiler-rt/test/dfsan/origin_unaligned_memtrans.c

mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
CC=gcc CXX=g++                                  \
cmake -DCMAKE_INSTALL_PREFIX=/usr               \
      -DLLVM_ENABLE_FFI=ON                      \
      -DCMAKE_BUILD_TYPE=Release                \
      -DLLVM_BUILD_LLVM_DYLIB=ON                \
      -DLLVM_LINK_LLVM_DYLIB=ON                 \
      -DLLVM_ENABLE_RTTI=ON                     \
      -DLLVM_TARGETS_TO_BUILD="host;BPF"        \
      -DLLVM_BINUTILS_INCDIR=/usr/include       \
      -DLLVM_INCLUDE_BENCHMARKS=OFF             \
      -DCLANG_DEFAULT_PIE_ON_LINUX=ON           \
      -Wno-dev                                  \
      -G Ninja                                  \
      ..                                        \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -DLLVM_TARGETS_TO_BUILD="host;AMDGPU;BPF" \
#      -DLLVM_TARGETS_TO_BUILD="host"      \

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# echo "4. Ninja Docs Build ..."
# echo "4. Ninja Docs Build ..." >> $LFSLOG_PROCESS
# echo "4. Ninja Docs Build ..." >> $PKGLOG_ERROR
# ninja docs-clang-html docs-clang-man
#     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "4. Ninja Check ..."
echo "4. Ninja Check ..." >> $LFSLOG_PROCESS
echo "4. Ninja Check ..." >> $PKGLOG_ERROR
sh -c 'ulimit -c 0 && ninja check-all'  \
    > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp bin/FileCheck /usr/bin

# install -d -m755 /usr/share/doc/llvm-16.0.5
# mv /usr/share/doc/LLVM/clang /usr/share/doc/llvm-16.0.5
# rmdir --ignore-fail-on-non-empty /usr/share/doc/LLVM


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
