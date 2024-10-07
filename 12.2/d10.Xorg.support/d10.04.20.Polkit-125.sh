# d10.04.20.Polkit-125.sh
#

#
# Dependencies Required:
#
#               d10.09.17 GLib-2.80.4
#
# Dependencies Recommended
#
#               d10.09.12 duktape-2.7.0
#               d10.09.74 libxslt-1.1.42
#               d10.12.11 elogind-255.5
#

#
# Required by:
#
#               ???.??.?? LXSession
#
# Runtime Recommended by:
#
#               d10.12.11 elogind-255.5
#

#
# Kernel Configuration
#
# General setup --->
#   -*- Namespaces support --->                                       [NAMESPACES]
#     [*] User namespace                                                 [USER_NS]
#

#
# read https://www.linuxfromscratch.org/blfs/view/12.2/postlfs/polkit.html
#

export PKG="polkit-125"
export PKGLOG_DIR=$LFSLOG/04.20
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
 

groupadd -fg 27 polkitd
useradd -c "PolicyKit Daemon Owner" -d /etc/polkit-1 -u 27 \
        -g polkitd -s /bin/false polkitd

sed -i '/systemd_sysusers_dir/s/^/#/' meson.build   \
        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

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
      -D tests=false                \
      -D js_engine=duktape          \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -D tests=true                 \
#      -D man=false                  \ # if libxslt is NOT installed
#      -D js_engine=mozjs            \ # if using SpiderMonkey

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# To test the results,
#      -D tests=true                 \
# first ensure that the system D-Bus daemon is running,
# and both D-Bus Python-1.3.2 and dbusmock-0.32.1 are installed.
# Then run ninja test.

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
