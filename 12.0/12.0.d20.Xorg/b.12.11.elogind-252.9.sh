# b.12.11.elogind-252.9.sh
# errata
#
# Dependencies Recommended:
#
#               12.10 dbus-1.14.8       ( runtime )
#               04.12 Linux-PAM-1.5.3   ( required for Xorg )
#               04.20 Polkit-123        ( runtime )
#
#
# Runtime Recommended by:
#
#               24.23 Xorg-Server-21.1.8
#               04.20 Polkit-123
#
#
# Kernel Configuration
#
#   File systems --->
#       [*] Inotify support for userspace                               [INOTIFY_USER]
#       Pseudo filesystems --->
#           [*] Tmpfs virtual memory file system support (former shm fs)         [TMPFS]
#           [*]   Tmpfs POSIX Access Control Lists                     [TMPFS_POSIX_ACL]
#
# some tests need the userspace cryptographic kernel API
#       -*- Cryptographic API --->                                              [CRYPTO]
#       Crypto core or helper --->
#           <*/M> Userspace cryptographic algorithm configuration          [CRYPTO_USER]
#       Userspace interface --->
#           <*/M> Hash algorithms                                 [CRYPTO_USER_API_HASH]
#
#
#   read NOTES at: https://www.linuxfromscratch.org/blfs/view/12.0/general/elogind.html
#

export PKG="elogind-252.9"
export PKGLOG_DIR=$LFSLOG/12.11
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build


echo "2. Meson ..."
echo "2. Meson ..." >> $LFSLOG_PROCESS
echo "2. Meson ..." >> $PKGLOG_ERROR
meson setup ..                                      \
            --prefix=/usr                           \
            --buildtype=release                     \
            -Dman=auto                              \
            -Ddocdir=/usr/share/doc/elogind-252.9   \
            -Dcgroup-controller=elogind             \
            -Ddev-kvm-mode=0660                     \
            -Ddbuspolicydir=/etc/dbus-1/system.d    \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

ln -sf  libelogind.pc /usr/lib/pkgconfig/libsystemd.pc
ln -sfn elogind /usr/include/systemd


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
