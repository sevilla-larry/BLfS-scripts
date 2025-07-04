# e41.16.01.Avahi-0.8.sh
#

#
# Dependencies Required:
#
#               d10.09.17  GLib-2.82.5
#
# Dependencies Recommended:
#
#               e11.25.16 GTK-3.24.48
#               e41.09.40 libdaemon-0.14
#
# Dependencies Optional:
#
#               a.08.91.14 libevent-2.1.12
#

#
# Recommended by:
#
#               e41.17.03 GeoClue-2.7.2
#

export PKG="avahi-0.8"
export PKGLOG_DIR=$LFSLOG/16.01
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -fg 84 avahi &&
useradd -c "Avahi Daemon Owner" -d /run/avahi-daemon -u 84 \
        -g avahi -s /bin/false avahi

groupadd -fg 86 netdev

patch -Np1 -i ../avahi-0.8-ipv6_race_condition_fix-1.patch  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -i '426a if (events & AVAHI_WATCH_HUP) { client_free(c); return; }' \
        avahi-daemon/simple-protocol.c                                  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure                 \
    --prefix=/usr           \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --disable-static        \
    --disable-mono          \
    --disable-monodoc       \
    --disable-python        \
    --disable-qt3           \
    --disable-qt4           \
    --disable-qt5           \
    --disable-core-docs     \
    --with-distro=none      \
    --with-systemdsystemunitdir=no  \
    --with-dbus-system-address='unix:path=/run/dbus/system_bus_socket'  \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#    --disable-libevent      \
#    --enable-core-docs      \

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# install Boot Script
# see Configuring Avahi
# https://www.linuxfromscratch.org/blfs/view/12.3/basicnet/avahi.html


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
