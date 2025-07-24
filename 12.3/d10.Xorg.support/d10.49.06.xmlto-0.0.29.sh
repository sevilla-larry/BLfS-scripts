# d10.49.06.xmlto-0.0.29.sh
#

#
# Dependencies Required:
#
#               a.08.91.36 docbook-xml-4.5
#               a.08.91.37 docbook-xsl-nons-1.79.2
#               a.08.91.38 libxslt-1.1.43 (errata)
#

#
# Required by:
#
#               e31.41.13 xdg-utils-1.2.1
#               ??? RabbitMQ ???
#
# Optionally by
#
#               d10.12.11 dbus-1.16.0
#               d20.24.03 xorgproto-2024.1
#               d20.24.05 libXdmcp-1.1.5
#               d20.24.08 Xorg.Libraries
#               d20.12.11 dbus-1.16.0
#               d20.24.19 Xwayland-24.1.8       (errata)
#               d20.24.20 Xorg-Server-21.1.18   (errata)
#               e11.25.35 libnotify-0.8.4
#               e11.12.02 AccountsService-23.13.9
#               e10.13.17 NASM-2.16.03
#               e11.10.08 giflib-5.2.2
#               e43.33.44 gnome-session-47.0.1
#

export PKG="xmlto-0.0.29"
export PKGLOG_DIR=$LFSLOG/49.06
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
autoreconf -fiv                 \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
LINKS="/usr/bin/links"          \
    ./configure --prefix=/usr   \
           >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
