# e10.09.71.libxkbcommon-1.8.0.sh
# Pass 2 with Xvfb
#

#
# Dependencies Required (runtime):
#
#               d20.24.18 XKeyboardConfig-2.44
#
# Dependencies Recommended:
#
#               d20.24.07 libxcb-1.17.0
#               d10.09.97 Wayland-1.23.0
#               d10.09.98 Wayland-Protocols-1.40
#
# Dependencies Optional:
#
#           PASS=2 already installed
#               Xvfb from
#                   d20.24.20 Xorg-Server-21.1.18   (errata)
#                or d20.24.19 Xwayland-24.1.8       (errata)
#

#
# Recommended (but required) by:
#
#               e11.25.16 GTK-3.24.48
#
# Recommended by:
#
#               e11.42.52 SDL2-2.30.11
#               e12.25.42 Qt-6.7.2
#
# Optional (required for test) by:
#
#               d20.24.18 XKeyboardConfig-2.44
#
# Optionally by:
#
#               e41.11.10 ibus-1.5.31
#

export PKG="libxkbcommon-1.8.0"
export PKGLOG_DIR=$LFSLOG/09.71.2
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build 
cd    build 

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..              \
      --prefix=/usr         \
      --buildtype=release   \
      -D enable-docs=false  \
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


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
