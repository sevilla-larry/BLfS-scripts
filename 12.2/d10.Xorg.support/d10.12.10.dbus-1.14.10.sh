# d10.12.10.dbus-1.14.10.sh
#

#
# Dependencies Recommended:
#
#               d20.24.08 Xorg Libraries ( dbus-launch )
#

#
# Required by:
#
#               25.02 at-spi2-core-2.48.3   ???
#               09.07 dbus-glib-0.112       ???
#
# Recommended by:
#
#               d20.24.24 Xorg-Server-21.1.13
#               d10.12.11 elogind-255.5
#
# Runtime needed for test by :
#
#               d10.09.17 GLib-2.80.4
#
# Optional by:
#
#               27.03 openbox-3.6.1         ???
#
# Note: initially tests are EXcluded due to complications
#

export PKG="dbus-1.14.10"
export PKGLOG_DIR=$LFSLOG/12.10
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr                        \
            --sysconfdir=/etc                    \
            --localstatedir=/var                 \
            --runstatedir=/run                   \
            --disable-doxygen-docs               \
            --disable-xml-docs                   \
            --disable-static                     \
            --with-systemduserunitdir=no         \
            --with-systemdsystemunitdir=no       \
            --docdir=/usr/share/doc/dbus-1.14.10 \
            --with-system-socket=/run/dbus/system_bus_socket    \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# if using DESTDIR install
# chown root:messagebus /usr/libexec/dbus-daemon-launch-helper
# chmod      4750       /usr/libexec/dbus-daemon-launch-helper

dbus-uuidgen --ensure

# NO elogind yet
#ln -sfv /var/lib/dbus/machine-id /etc

echo "execute: make install-dbus   from blfs-bootscripts"
echo "execute: make install-dbus   from blfs-bootscripts" >> $LFSLOG_PROCESS
echo "execute: make install-dbus   from blfs-bootscripts" >> $PKGLOG_ERROR

echo "read: https://www.linuxfromscratch.org/blfs/view/12.2/general/dbus.html for other info"


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
