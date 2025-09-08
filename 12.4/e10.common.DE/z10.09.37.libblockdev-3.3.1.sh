# e10.09.37.libblockdev-3.3.1.sh
# Gnome (LXQt KDE)
#

#
# Dependencies Required:
#
#               d10.09.18 GLib-2.84.4
#
# Dependencies Recommended:
#
#           ??? e41.04.04 cryptsetup-2.7.5
#               e10.09.31 keyutils-1.6.3
#           ??? e41.09.34 libatasmart-0.19
#               e10.09.38 libbytesize-2.11
#           ??? e41.09.53 libnvme-1.15
#           ??? e41.05.06 LVM2-2.03.34
#
# Dependencies Optional:
#
#               e10.09.30 JSON-GLib-1.10.6
#

#
# Required by:
#
#               e10.12.35 UDisks-2.10.1     (errata sed)
#

export PKG="libblockdev-3.3.1"
export PKGLOG_DIR=$LFSLOG/09.37
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
./configure --prefix=/usr       \
            --sysconfdir=/etc   \
            --with-python3      \
            --without-escrow    \
            --without-gtk-doc   \
            --without-lvm       \
            --without-lvm_dbus  \
            --without-nvdimm    \
            --without-tools     \
            --without-btrfs     \
            --without-mdraid    \
            --without-dm        \
            --without-mpath     \
            --without-smartmontools \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#            --without-nvme      \ nvme is integral part of UDisks (stupid)

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
