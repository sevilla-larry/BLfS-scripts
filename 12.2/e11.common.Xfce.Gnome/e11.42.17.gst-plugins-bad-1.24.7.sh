# e11.42.17.gst-plugins-bad-1.24.7.sh
#

#
# Dependencies Required:
#
#               e11.42.15 gst-plugins-base-1.24.7
#
# Dependencies Recommended:
#
#               d20.42.41 libva-2.22.0      PC
#
# Dependencies Optional:
#
#               b11.17.02 cURL-8.10.1
#               e11.25.17 GTK+-3.24.43
#               e11.42.16 gst-plugins-good-1.24.7
#               e11.09.29 JSON-Glib-1.8.0
#               e10.10.14 Little CMS-2.16
#               e10.10.16 libexif-0.6.24
#               e10.10.27 libwebp-1.4.0
#               e10.09.71 libxkbcommon-1.7.0
#               e11.04.16 Nettle-3.10
#               d10.09.97 Wayland-1.23.0
#

#
# Recommended ( but needed by ):
#
#               e11.25.18 GTK-4.14.5
#

export PKG="gst-plugins-bad-1.24.7"
export PKGLOG_DIR=$LFSLOG/42.17
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

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
meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D gpl=enabled            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Several tests need a terminal emulator
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
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
