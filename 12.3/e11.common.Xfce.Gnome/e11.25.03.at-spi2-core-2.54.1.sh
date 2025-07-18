# e11.25.03.at-spi2-core-2.54.1.sh
#

#
# Dependencies Required:
#
#               d20.12.11 dbus-1.16.0
#               d10.09.17 GLib-2.82.5
#               d20.24.08 Xorg Libraries
#
# Dependencies Required Runtime:
#
#               e11.33.03 gsettings-desktop-schemas-47.1
#

#
# Required by:
#
#               ???       GTK+-2.24.33  ???
#               e11.25.16 GTK-3.24.48
#
# Optional by:
#
#               f2.26.02  lightdm-1.32.0
#

export PKG="at-spi2-core-2.54.1"
export PKGLOG_DIR=$LFSLOG/25.03
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
meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D systemd_user_dir=/tmp  \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -v /tmp/at-spi-dbus-bus.service  \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

#Test needs to run in a graphical environment
#
#echo "5. Ninja Test ..."
#echo "5. Ninja Test ..." >> $LFSLOG_PROCESS
#echo "5. Ninja Test ..." >> $PKGLOG_ERROR
#dbus-run-session ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
