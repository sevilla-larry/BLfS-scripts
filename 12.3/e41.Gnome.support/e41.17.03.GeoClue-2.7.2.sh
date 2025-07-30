# e41.17.03.GeoClue-2.7.2.sh
#

#
# Dependencies Required:
#
#               e10.09.29 JSON-GLib-1.10.6
#               e41.17.18 libsoup-3.6.5         (errata)
#
# Dependencies Recommended:
#
#               e41.16.01 Avahi-0.8
#               e11.25.35 libnotify-0.8.4
#           ??? e41.12.22 ModemManager-1.18.12  (deferred)
#               e11.13.36 Vala-0.56.17
#

#
# Required by:
#
#				e43.33.38 gnome-settings-daemon-47.2
#               e44.34.11 gnome-maps-47.4
#               e44.34.17 gnome-weather-47.0
#
# Recommended by:
#
#               e41.25.45 WebKitGTK-2.48.3  (errata)
#

export PKG="geoclue-2.7.2"
export PKGLOG_DIR=$LFSLOG/17.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr       \
            --buildtype=release \
            -D gtk-doc=false    \
            -D 3g-source=false  \
            -D modem-gps-source=false   \
            -D cdma-source=false        \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
# note ModemManager NOT installed

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
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
