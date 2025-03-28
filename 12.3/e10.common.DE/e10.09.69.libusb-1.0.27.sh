# e10.09.69.libusb-1.0.27.sh
#

#
# Required by:
#
#               e10.12.36 UPower-1.90.4
#

#
# Kernel Settings
#
# Device Drivers --->
#   [*] USB support --->                                             [USB_SUPPORT]
#     <*/M>   Support for Host-side USB                                      [USB]
#     [*]     PCI based USB host interface                               [USB_PCI]
#     # These are most common USB controller drivers for PC-like systems.
#     # For modern systems often [USB_XHCI_HCD] is the only one needed
#     # even if the system has USB 2.0 ports:
#     < /*/M> xHCI HCD (USB 3.0) support                            [USB_XHCI_HCD]
#     < /*/M> EHCI HCD (USB 2.0) support                            [USB_EHCI_HCD]
#     < /*/M> OHCI HCD (USB 1.1) support                            [USB_OHCI_HCD]
#

export PKG="libusb-1.0.27"
export PKGLOG_DIR=$LFSLOG/09.69
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
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr     \
            --disable-static  \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

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
