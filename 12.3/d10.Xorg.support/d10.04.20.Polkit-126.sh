# d10.04.20.Polkit-126.sh
#

#
# Dependencies Required:
#
#               d10.09.12 duktape-2.7.0
#               d10.09.17 GLib-2.82.5
#
# Dependencies Recommended
#
#               b10.09.74 libxslt-1.1.42
#               a.08.94B  Linux-PAM-1.7.0
#               d10.12.12 elogind-255.17
#

#
# Required by:
#
#               e11.04.21 polkit-gnome-0.105
#               e11.12.02 AccountsService-23.13.9
#               e41.12.08 Colord-1.4.7
#               e41.12.13 blocaled-0.7
#               e41.12.27 Power-profiles-daemon-0.30
#               e41.12.35 UDisks-2.10.1
#               e43.33.42 gnome-shell-47.4
#               ???.??.?? LXSession
#
# Runtime Recommended by:
#
#               d10.12.12 elogind-255.17
#

#
# Kernel Configuration
#
# General setup --->
#   -*- Namespaces support --->                                       [NAMESPACES]
#     [*] User namespace                                                 [USER_NS]
#

#
# read https://www.linuxfromscratch.org/blfs/view/12.3/postlfs/polkit.html
#

export PKG="polkit-126"
export PKGLOG_DIR=$LFSLOG/04.20
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG
 

groupadd -fg 27 polkitd
useradd -c "PolicyKit Daemon Owner" -d /etc/polkit-1 -u 27 \
        -g polkitd -s /bin/false polkitd

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                      \
      --prefix=/usr                 \
      --buildtype=release           \
      -D man=true                   \
      -D session_tracking=elogind   \
      -D systemdsystemunitdir=/tmp  \
      -D tests=false                \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -D tests=true                 \
#      -D man=false                  \ # if libxslt is NOT installed
#      -D js_engine=mozjs            \ # if using SpiderMonkey
#      -D js_engine=duktape          \ # LfS 12.2

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# To test the results,
#      -D tests=true                 \
# first ensure that the system D-Bus daemon is running,
# and both D-Bus Python-1.3.2 and dbusmock-0.34.3 are installed.
# Then run ninja test.

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -v /tmp/*.service                    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
rm -rf /usr/lib/{sysusers,tmpfiles}.d   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
