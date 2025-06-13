# f2.26.02.lightdm-1.32.0.sh
#

#
# Dependencies Required:
#
#               e23.35.04  Exo-4.20.0
#               a.08.91.35 libgcrypt-1.11.0
#               e11.49.05  itstool-2.0.7
#               a.08.92.01 Linux-PAM-1.7.0
#
# Dependencies Required (Runtime):
#
#               d20.24.20 Xorg-Server-21.1.16
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               e11.25.36 libxklavier-5.4
#               e10.13.36 Vala-0.56.17
#
# Dependencies Optional:
#
#               e11.12.02 AccountsService-23.13.9
#
# Dependencies Optional:
#
#               e11.25.03 at-spi2-core-2.54.1
#

export PKG="lightdm-1.32.0"
export PKGLOG_DIR=$LFSLOG/26.02
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 65 lightdm
useradd  -c "Lightdm Daemon"    \
         -d /var/lib/lightdm    \
         -u 65                  \
         -g lightdm             \
         -s /bin/false          \
         lightdm

sed -i s/systemd/elogind/ data/pam/*    \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
#ITSTOOL=/bin/true                           \
./configure --prefix=/usr                   \
            --libexecdir=/usr/lib/lightdm   \
            --localstatedir=/var            \
            --sbindir=/usr/bin              \
            --sysconfdir=/etc               \
            --disable-static                \
            --disable-tests                 \
            --with-greeter-user=lightdm     \
            --with-greeter-session=lightdm-gtk-greeter  \
            --docdir=/usr/share/doc/lightdm-1.32.0      \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp -v tests/src/lightdm-session /usr/bin                \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
sed -i '1 s/sh/bash --login/' /usr/bin/lightdm-session  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
rm -vrf /etc/init                                       \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -dm755 -o lightdm -g lightdm /var/lib/lightdm        \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -dm755 -o lightdm -g lightdm /var/lib/lightdm-data   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -dm755 -o lightdm -g lightdm /var/cache/lightdm      \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -dm770 -o lightdm -g lightdm /var/log/lightdm        \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "***** GREETER *****" >> $PKGLOG_TAR
echo "***** GREETER *****" >> $PKGLOG_CONFIG
echo "***** GREETER *****" >> $PKGLOG_BUILD
echo "***** GREETER *****" >> $PKGLOG_INSTALL
echo "***** GREETER *****" >> $PKGLOG_ERROR

tar -xvf ../lightdm-gtk-greeter-2.0.9.tar.gz    \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

cd lightdm-gtk-greeter-2.0.9

    echo "5. Configure greeter ..."
    echo "5. Configure greeter ..." >> $LFSLOG_PROCESS
    echo "5. Configure greeter ..." >> $PKGLOG_ERROR
    ./configure --prefix=/usr                 \
                --libexecdir=/usr/lib/lightdm \
                --sbindir=/usr/bin            \
                --sysconfdir=/etc             \
                --with-libxklavier            \
                --enable-kill-on-sigterm      \
                --disable-libido              \
                --disable-libindicator        \
                --disable-static              \
                --disable-maintainer-mode     \
                --docdir=/usr/share/doc/lightdm-gtk-greeter-2.0.9   \
                >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

    echo "6. Make Build greeter ..."
    echo "6. Make Build greeter ..." >> $LFSLOG_PROCESS
    echo "6. Make Build greeter ..." >> $PKGLOG_ERROR
    make >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

    echo "7. Make Install greeter ..."
    echo "7. Make Install greeter ..." >> $LFSLOG_PROCESS
    echo "7. Make Install greeter ..." >> $PKGLOG_ERROR
    make install >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "Note: need to add lightdm bootscript"


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
