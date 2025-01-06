# e11.42.15.gst-plugins-base-1.24.10.sh
# (errata)
#

#
# Dependencies Required:
#
#               e11.42.14 gstreamer-1.24.7
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.80.4
#               e11.11.11 ISO Codes-4.16.0
#               e11.09.45 libgudev-238
#               e10.10.18 libjpeg-turbo-3.0.1
#               d10.10.22 libpng-1.6.43
#               d20.24.16 Mesa-24.1.5
#               e10.25.38 Pango-1.54.0
#               d10.09.98 Wayland-Protocols-1.36
#               d20.24.08 Xorg Libraries
#
# Dependencies Optional:
#
#               e11.25.16 Graphene-1.10.8
#               e11.25.17 GTK+-3.24.43
#

#
# Required by:
#
#               e11.42.16 gst-plugins-good-1.24.7
#               e11.42.17 gst-plugins-bad-1.24.7
#
# Recommended by:
#
#               g12.39.03 LibreOffice-24.8.0
#
# Optionally by:
#
#               g12.34.04 Evince-46.3.1
#

export PKG="gst-plugins-base-1.24.10"
export PKGLOG_DIR=$LFSLOG/42.15
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
      --wrap-mode=nodownload    \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Tests require X terminal running
#
#echo "4. Ninja Test ..."
#echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
#echo "4. Ninja Test ..." >> $PKGLOG_ERROR
#ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
