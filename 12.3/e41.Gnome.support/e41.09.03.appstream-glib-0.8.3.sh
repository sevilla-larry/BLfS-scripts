# e41.09.03.appstream-glib-0.8.3.sh
#

#
# Dependencies Required:
#
#               a.08.93.04 cURL-8.14.1      (errata)
#               e10.25.10  gdk-pixbuf-2.42.12
#               e11.25.16  GTK-3.24.48
#               a.08.91.12 libarchive-3.8.1 (errata)
#
# Dependencies Optional:
#
#               a.08.91.36 docbook-xml-4.5
#               a.08.91.37 docbook-xsl-nons-1.79.2
#               a.08.91.38 libxslt-1.1.43
#               b10.09.76 libyaml-0.2.5
#

#
# Optionally by:
#
#               e44.34.10 gnome-disk-utility-46.1
#               e44.34.13 gnome-power-manager-43.0
#               e44.34.15 gnome-system-monitor-47.1
#               e44.34.16 gnome-terminal-3.54.2
#               e44.34.17 gnome-weather-47.0
#               e44.34.18 Gucharmap-16.0.2
#               e44.34.10 gnome-disk-utility-46.1
#               e44.34.13 gnome-power-manager-43.0
#               e44.34.15 gnome-system-monitor-47.1
#               e44.34.16 gnome-terminal-3.54.2
#               e44.34.17 gnome-weather-47.0
#               e44.34.18 Gucharmap-16.0.2
#

export PKG="appstream-glib-0.8.3"
export PKGLOG_DIR=$LFSLOG/09.03
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG

                  
mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..              \
      --prefix=/usr         \
      --buildtype=release   \
      -D rpm=false          \
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
