# e41.25.45.WebKitGTK-2.46.6.sh
# GTK-4 versioin
#

#
# Dependencies Required:
#
#               a.08.9x.?1 CMake-3.31.5
#

#
# Required by:
#
#               e41.09.85 Protobuf-29.3
#

export PKG="webkitgtk-2.46.6"
export PKGLOG_DIR=$LFSLOG/25.45
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


mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_BUILD_TYPE=Release       \
      -D CMAKE_INSTALL_PREFIX=/usr      \
      -D CMAKE_SKIP_INSTALL_RPATH=ON    \
      -D PORT=GTK                       \
      -D LIB_INSTALL_DIR=/usr/lib       \
      -D USE_LIBBACKTRACE=OFF           \
      -D USE_LIBHYPHEN=OFF              \
      -D ENABLE_GAMEPAD=OFF             \
      -D ENABLE_MINIBROWSER=ON          \
      -D ENABLE_DOCUMENTATION=OFF       \
      -D USE_WOFF2=OFF                  \
      -D USE_GTK4=ON                    \
      -D ENABLE_JOURNALD_LOG=OFF        \
      -D ENABLE_BUBBLEWRAP_SANDBOX=ON   \
      -D USE_SYSPROF_CAPTURE=NO         \
      -W no-dev                         \
      -G Ninja                          \
      ..                                \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -vdm755 /usr/share/gtk-doc/html             \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -rv ../Documentation/* /usr/share/gtk-doc/html   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
