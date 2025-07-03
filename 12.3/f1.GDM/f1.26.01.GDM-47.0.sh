# f1.26.01.GDM-47.0.sh
#

#
# Dependencies Required:
#
#               e11.12.02  AccountsService-23.13.9
#               e43.33.31  DConf-0.40.0
#               e11.42.26  libcanberra-0.30
#               e11.25.16  GTK-3.24.48
#               a.08.92.01 Linux-PAM-1.7.0
#
# Dependencies Runtime:
#
#               e43.33.44 gnome-session-47.0.1
#               e43.33.42 gnome-shell-47.4
#               d10.12.12 elogind-255.17
#
# Dependencies Optional:
#
#               e41.09.30 keyutils-1.6.3
#

#
# Required Runtime by:
#
#               e43.33.42 gnome-shell-47.4
#

export PKG="gdm-47.0"
export PKGLOG_DIR=$LFSLOG/26.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


groupadd -g 21 gdm
useradd -c "GDM Daemon Owner" -d /var/lib/gdm -u 21 \
        -g gdm -s /bin/false gdm
passwd -ql gdm

sed -e 's@systemd@elogind@'                                 \
    -e '/elogind/isession  required       pam_loginuid.so'  \
    -i data/pam-lfs/gdm-launch-environment.pam              \
    > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build 
cd    build 

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr               \
            --buildtype=release         \
            -D gdm-xsession=true        \
            -D run-dir=/run/gdm         \
            -D logind-provider=elogind  \
            -D systemd-journal=false    \
            -D systemdsystemunitdir=no  \
            -D systemduserunitdir=no    \
            -D initial-vt=7             \
            ..                          \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "Note: need to configure GDM and add bootscript"
# https://www.linuxfromscratch.org/blfs/view/12.3/x/gdm.html


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
