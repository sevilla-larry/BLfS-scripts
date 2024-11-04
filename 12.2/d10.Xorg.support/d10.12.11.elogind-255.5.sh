# d10.12.11.elogind-255.5.sh
#

#
# Dependencies Recommended (required for Xorg):
#
#               a.08.94B Linux-PAM-1.6.1
#
# Dependencies Recommended:
#
#               d10.12.10 dbus-1.14.10  ( runtime )
#               d10.04.20 Polkit-125    ( runtime )
#
# Dependencies Optional:
#
#               d10.13.23.12 lxml-5.3.0
#

#
# Recommended (runtime) by:
#
#               d20.24.24 Xorg-Server-21.1.13
#
# Recommended by:
#
#               d10.04.20 Polkit-125
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
#   read NOTES at: https://www.linuxfromscratch.org/blfs/view/12.2/general/elogind.html
#

export PKG="elogind-255.5"
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

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                                  \
      --prefix=/usr                             \
      --buildtype=release                       \
      -D man=auto                               \
      -D docdir=/usr/share/doc/elogind-255.5    \
      -D cgroup-controller=elogind              \
      -D dev-kvm-mode=0660                      \
      -D dbuspolicydir=/etc/dbus-1/system.d     \
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

ln -sfv  libelogind.pc /usr/lib/pkgconfig/libsystemd.pc \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
ln -sfvn elogind /usr/include/systemd                   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
