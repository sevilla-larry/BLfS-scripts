# d10.12.12.elogind-255.17.sh
#

#
# Dependencies Recommended (required for Xorg):
#
#               a.08.94B Linux-PAM-1.6.1
#
# Dependencies Recommended:
#
#               d10.12.11 dbus-1.16.0   ( runtime )
#               d10.04.20 Polkit-126    ( runtime )
#
# Dependencies Optional:
#
#               b10.13.24.12 lxml-5.3.1
#

#
# Recommended (runtime) by:
#
#               d20.24.20 Xorg-Server-21.1.16
#
# Recommended by:
#
#               d10.04.20 Polkit-126
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
#   read NOTES at: https://www.linuxfromscratch.org/blfs/view/12.3/general/elogind.html
#

export PKG="elogind-255.17"
export PKGLOG_DIR=$LFSLOG/12.12
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


mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                                  \
      --prefix=/usr                             \
      --buildtype=release                       \
      -D man=auto                               \
      -D docdir=/usr/share/doc/elogind-255.17    \
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

cat >> /etc/pam.d/system-session << "EOF"   2>> $PKGLOG_ERROR
# Begin elogind addition

session  required    pam_loginuid.so
session  optional    pam_elogind.so

# End elogind addition
EOF

cat > /etc/pam.d/elogind-user << "EOF"      2>> $PKGLOG_ERROR
# Begin /etc/pam.d/elogind-user

account  required    pam_access.so
account  include     system-account

session  required    pam_env.so
session  required    pam_limits.so
session  required    pam_unix.so
session  required    pam_loginuid.so
session  optional    pam_keyinit.so force revoke
session  optional    pam_elogind.so

auth     required    pam_deny.so
password required    pam_deny.so

# End /etc/pam.d/elogind-user
EOF


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
