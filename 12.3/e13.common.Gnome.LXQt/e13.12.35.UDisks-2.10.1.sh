# e13.12.35.UDisks-2.10.1.sh
# errata sed fix
#

#
# Dependencies Required:
#
#           ??? e41.09.34 libatasmart-0.19      (deferred)
#               e13.09.36 libblockdev-3.3.1     (errata)
#               e10.09.45 libgudev-238
#               d10.04.20 Polkit-126
#               d10.09.17 GLib-2.82.5
#
# Dependencies Recommended:
#
#               d10.12.12 elogind-255.17
#
# Dependencies Optional (for the integration tests):
#
#               e13.13.24.06 D-Bus Python-1.3.2
#               e13.13.24.23 PyGObject-3.50.0
#
# Dependencies Optional:
#
#               a.08.91.38 libxslt-1.1.43     (errata)
#
# Dependencies Optional Runtime:
#
#               d20.12.10 dbus-1.16.0
#


#
# Required by:
#
#               e43.33.40 gnome-control-center-47.4
#               e44.34.10 gnome-disk-utility-46.1
#
# Recommended by:
#
#               e43.33.33 Gvfs-1.56.1
#
# Optional (runtime) by:
#
#               e32.37.04 solid-6.11.0 for lxqt
#

export PKG="udisks-2.10.1"
export PKGLOG_DIR=$LFSLOG/12.35
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


sed -i 's/fstype, NULL/fstype, "nodev,nosuid"/' \
    src/udiskslinuxfilesystemhelpers.c          \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr               \
            --sysconfdir=/etc           \
            --localstatedir=/var        \
            --disable-static            \
            --enable-available-modules  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

mkdir   -v /var/run/udisks2 \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mkdir   -v /var/lib/udisks2 \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
make ci     >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
