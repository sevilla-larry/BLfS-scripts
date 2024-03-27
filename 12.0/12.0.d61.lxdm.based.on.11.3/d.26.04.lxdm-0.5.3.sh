# d.26.04.lxdm-0.5.3.sh
#
# ( based on BLfS 11.3 Chapter 26 Section 3, [note: .04 was used for de-confliction])
#
#
# Dependencies Required:
#
#               25.19 GTK+-2.24.33
#               11.11 ISO Codes-4.15.0  upgrade from 4.12.0
#
# Dependencies Required Runtime:
#
#               10.23 librsvg-2.56.3    upgrade from 2.54.5
#
# Dependencies Recommended:
#
#               37.09 LXSession-0.5.5
#
# Dependencies Optional:
#
#               25.20 GTK+-3.24.38
#

export PKG="lxdm-0.5.3"
export PKGLOG_DIR=$LFSLOG/26.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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


cat > pam/lxdm << "EOF"
# Begin /etc/pam.d/lxdm

auth     requisite      pam_nologin.so
auth     required       pam_env.so
auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     include        system-auth

account  include        system-account

password include        system-password

session  required       pam_limits.so
session  include        system-session

# End /etc/pam.d/lxdm
EOF

sed -i 's:sysconfig/i18n:profile.d/i18n.sh:g' data/lxdm.in
sed -i 's:/etc/xprofile:/etc/profile:g' data/Xsession
sed -e 's/^bg/#&/'        \
    -e '/reset=1/ s/# //' \
    -e 's/logou$/logout/' \
    -e "/arg=/a arg=$XORG_PREFIX/bin/X" \
    -i data/lxdm.conf.in

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --with-pam        \
            --with-systemdsystemunitdir=no  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
