# e21.25.35.libnotify-0.8.4.sh
#

#
# Dependencies Required:
#
#               e11.25.16 GTK-3.24.48
#
# Dependencies Optional:
#
#               d10.09.17 GLib-2.82.5
#               d10.49.06 xmlto-0.0.29
#
# Dependencies Required Runtime:
#
#               e24.36.05 xfce4-notifyd-0.9.7
#

#
# Required by:
#
#               e23.35.14 xfce4-power-manager-4.20.0
#               e24.36.05 xfce4-notifyd-0.9.7
#               g12.40.03 Firefox-128.4.0esr (errata)   ???
#
# Recommended by:
#
#               e23.35.10 thunar-4.20.2
#               e23.35.11 thunar-volman-4.20.0 (not used)
#               e23.35.15 xfce4-settings-4.20.1
#               e23.35.16 Xfdesktop-4.20.1
#

export PKG="libnotify-0.8.4"
export PKGLOG_DIR=$LFSLOG/25.35
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
            -D man=false        \
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

if [ -e /usr/share/doc/libnotify ]; then
  rm -vrf /usr/share/doc/libnotify-0.8.4    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
  mv -v   /usr/share/doc/libnotify{,-0.8.4} \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
fi


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
