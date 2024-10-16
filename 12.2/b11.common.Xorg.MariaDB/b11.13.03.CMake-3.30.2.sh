# b11.13.03.CMake-3.30.2.sh
#

#
# Dependencies Recommended:
#
#               b11.17.02 cURL-8.10.1 (errata)
#
#               ???.09.28 libarchive-3.6.2  ( not yet compiled/installed )
#               ???.09.65 libuv-1.44.2      ( not yet compiled/installed )
#               ???.17.20 nghttp2-1.52.0    ( not yet compiled/installed )
#
#

#
# Required by:
#
#               c11.22.03 MariaDB-10.11.8
#               d10.09.90 SPIRV-Headers-1.3.290.0
#               d10.09.91 SPIRV-Tools-1.3.290.0
#               d10.13.12 LLVM-18.1.7
#               d10.25.12 Glslang-14.3.0
#               d20.42.43 libvdpau-va-gl-0.4.2
#               e21.10.18 libjpeg-turbo-3.0.1
#               ???.10.10 Graphite2-1.3.14      ???
#
# Optional by:
#
#               d20.25.34 Libdrm-2.4.122
#

export PKG="cmake-3.30.2"
export PKGLOG_DIR=$LFSLOG/13.03
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


sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake   \
    > $PKGLOG_OTHERS   2>> $PKGLOG_ERROR


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./bootstrap --prefix=/usr           \
            --system-libs           \
            --mandir=/share/man     \
            --no-system-jsoncpp     \
            --no-system-cppdap      \
            --no-system-librhash    \
            --no-system-libarchive  \
            --no-system-libuv       \
            --no-system-nghttp2     \
            --docdir=/share/doc/cmake-3.30.2    \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#            --no-system-curl        \

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
LC_ALL=en_US.UTF-8 \
    bin/ctest $MAKEFLAGS    \
    -O  $PKGLOG_CHECK > /dev/null 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
