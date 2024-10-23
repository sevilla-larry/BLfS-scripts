# f32.26.03.sddm-0.21.0.sh
#

#
# Dependencies Required:
#
#               b11.13.03 CMake-3.30.2
#               e12.29.02 extra-cmake-modules-6.5.0
#               e12.25.42 Qt-6.7.2
#

export PKG="sddm-0.21.0"
export PKGLOG_DIR=$LFSLOG/26.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 64 sddm
useradd  -c "sddm Daemon"   \
         -d /var/lib/sddm   \
         -u 64 -g sddm      \
         -s /bin/false      \
         sddm

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D ENABLE_JOURNALD=OFF       \
      -D NO_SYSTEMD=ON             \
      -D RUNTIME_DIR=/run/sddm     \
      -D USE_ELOGIND=ON            \
      -D BUILD_MAN_PAGES=OFF       \
      -D BUILD_WITH_QT6=ON         \
      -D DATA_INSTALL_DIR=/usr/share/sddm \
      -D DBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
      ..                           \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -D BUILD_MAN_PAGES=ON        \

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -dm755 -o sddm -g sddm /var/lib/sddm \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
/usr/bin/sddm --example-config > /etc/sddm.conf \
        2>> $PKGLOG_ERROR

# Remote access
sed -i 's/-nolisten tcp//' /etc/sddm.conf   \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# Num Lock ON
sed -i '/Numlock/s/none/on/' /etc/sddm.conf \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# Virtual keyboard OFF
sed -i 's/qtvirtualkeyboard//' /etc/sddm.conf   \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat > /etc/pam.d/sddm << "EOF"              2>> $PKGLOG_ERROR
# Begin /etc/pam.d/sddm

auth     requisite      pam_nologin.so
auth     required       pam_env.so

auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     include        system-auth

account  include        system-account
password include        system-password

session  required       pam_limits.so
session  include        system-session

# End /etc/pam.d/sddm
EOF

cat > /etc/pam.d/sddm-autologin << "EOF"    2>> $PKGLOG_ERROR
# Begin /etc/pam.d/sddm-autologin

auth     requisite      pam_nologin.so
auth     required       pam_env.so

auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     required       pam_permit.so

account  include        system-account

password required       pam_deny.so

session  required       pam_limits.so
session  include        system-session

# End /etc/pam.d/sddm-autologin
EOF

cat > /etc/pam.d/sddm-greeter << "EOF"      2>> $PKGLOG_ERROR
# Begin /etc/pam.d/sddm-greeter

auth     required       pam_env.so
auth     required       pam_permit.so

account  required       pam_permit.so
password required       pam_deny.so
session  required       pam_unix.so
-session optional       pam_systemd.so

# End /etc/pam.d/sddm-greeter
EOF

echo "Note: need to add sddm bootscript"


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
