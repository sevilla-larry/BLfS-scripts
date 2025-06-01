# d20.12.11.dbus-1.16.0.Pass2.sh
#

#
# Dependencies Recommended:
#
#               d20.24.08 Xorg Libraries (dbus-launch)
#
# Dependencies Optional:
#
#               d10.49.06 xmlto-0.0.29
#

#
# Required by:
#
#               e21.25.03 at-spi2-core-2.52.0
#               09.07 dbus-glib-0.112           ???
#
# Recommended by:
#
#               d20.24.20 Xorg-Server-21.1.16
#               g11.42.49 PulseAudio-17.0
#               e12.25.42 Qt-6.7.2              ???
#
# Recommended (runtime) by:
#
#               d10.12.12 elogind-255.17
#
# Runtime needed by:
#
#               d10.09.17 GLib-2.82.5
#
# Optionally by:
#
#               e10.13.36 Vala-0.56.17
#               e31.27.03 openbox-3.6.1         ???
#

#
# Note: tests are EXcluded due to complications
#

export PKG="dbus-1.16.0"
export PKGLOG_DIR=$LFSLOG/12.11.2
#export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

#echo "1. Extract tar..."
#echo "1. Extract tar..." >> $LFSLOG_PROCESS
#echo "1. Extract tar..." >> $PKGLOG_ERROR
#tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "1. Build Clean ..."
echo "1. Build Clean ..." >> $LFSLOG_PROCESS
echo "1. Build Clean ..." >> $PKGLOG_ERROR
rm -rf  build
mkdir   build
cd      build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr           \
            --buildtype=release     \
            --wrap-mode=nofallback  \
            -D systemd=disabled     \
            ..                      \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# if using DESTDIR install
# chown -v root:messagebus /usr/libexec/dbus-daemon-launch-helper
# chmod -v      4750       /usr/libexec/dbus-daemon-launch-helper

# dbus-uuidgen --ensure

# elogind already installed
ln -sfv /var/lib/dbus/machine-id /etc   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# documentation already installed

echo "execute: make install-dbus   from blfs-bootscripts"
echo "execute: make install-dbus   from blfs-bootscripts" >> $LFSLOG_PROCESS
echo "execute: make install-dbus   from blfs-bootscripts" >> $PKGLOG_ERROR

echo "read: https://www.linuxfromscratch.org/blfs/view/12.3/general/dbus.html for other info"


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
