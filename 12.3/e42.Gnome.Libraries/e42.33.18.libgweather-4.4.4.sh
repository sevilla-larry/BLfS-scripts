# e42.33.18.libgweather-4.4.4.sh
#

#
# Dependencies Required:
#
#               e42.33.09    geocode-glib-3.26.4
#               e11.25.16    GTK-3.24.48
#               e41.17.18    libsoup-3.6.5      (errata)
#               e13.13.24.23 PyGObject-3.50.0
#
# Dependencies Recommended:
#
#               d10.09.17  GLib-2.82.5
#               a.08.91.08 libxml2-2.14.3       (errata)
#               e11.13.36  Vala-0.56.17
#

#
# Required by:
#
#				e43.33.38 gnome-settings-daemon-47.2
#               e44.34.17 gnome-weather-47.0
#
# Recommended by:
#
#               e42.33.21 evolution-data-server-3.54.3
#
# Required Runtime by:
#
#               e43.33.42 gnome-shell-47.4
#

export PKG="libgweather-4.4.4"
export PKGLOG_DIR=$LFSLOG/33.18
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
meson setup --prefix=/usr       \
            --buildtype=release \
            -D gtk_doc=false    \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "5. Ninja Test ..."
echo "5. Ninja Test ..." >> $LFSLOG_PROCESS
echo "5. Ninja Test ..." >> $PKGLOG_ERROR
LC_ALL=C ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
