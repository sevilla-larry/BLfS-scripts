# e11.12.02.AccountsService-23.13.9.sh
#

#
# Dependencies Required:
#
#               d10.04.20 Polkit-126
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               d10.12.12 elogind-255.17
#               e11.13.36 Vala-0.56.17
#
# Dependencies Optional:
#
#               d10.49.06 xmlto-0.0.29
#

#
# Required by:
#
#               e11.04.21 polkit-gnome-0.105
#

export PKG="accountsservice-23.13.9"
export PKGLOG_DIR=$LFSLOG/12.02
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG
 

mv -v tests/dbusmock{,-tests}   \
    >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR

sed -e '/accounts_service\.py/s/dbusmock/dbusmock-tests/'   \
    -e 's/assertEquals/assertEqual/'                        \
    -i tests/test-libaccountsservice.py                     \
    >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR

sed -i '/^SIMULATED_SYSTEM_LOCALE/s/en_IE.UTF-8/en_HK.iso88591/'    \
    tests/test-daemon.py    \
    >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..             \
      --prefix=/usr        \
      --buildtype=release  \
      -D admin_group=adm   \
      -D elogind=true      \
      -D systemdsystemunitdir=no    \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

grep 'print_indent'     ../subprojects/mocklibc-1.0/src/netgroup.c  \
     | sed 's/ {/;/' >> ../subprojects/mocklibc-1.0/src/netgroup.h  \
                    2>> $PKGLOG_ERROR

sed -i '1i#include <stdio.h>'                                       \
    ../subprojects/mocklibc-1.0/src/netgroup.h                      \
    >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
