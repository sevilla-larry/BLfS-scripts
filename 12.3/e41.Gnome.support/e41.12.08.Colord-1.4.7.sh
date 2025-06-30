# e41.12.08.Colord-1.4.7.sh
#

#
# Dependencies Required:
#
#               d20.12.11  dbus-1.16.0
#               d10.09.17  GLib-2.82.5
#               e10.10.14  LittleCMS-2.17
#               e10.09.45  libgudev-238
#               e41.09.46  libgusb-0.4.9
#               d10.04.20  Polkit-126
#               a.08.91.18 SQLite-3.49.1
#
# Dependencies Recommended:
#
#               d10.12.12 elogind-255.17
#               e10.13.36 Vala-0.56.17
#
# Dependencies Optional:
#
#               a.08.91.36 docbook-xml-4.5
#               a.08.91.37 docbook-xsl-nons-1.79.2
#               a.08.91.38 libxslt-1.1.43
#

#
# Recommended by:
#
#               e43.33.38 gnome-settings-daemon-47.2
#
# Optionally by:
#
#               e41.25.17 GTK-4.16.12
#

export PKG="colord-1.4.7"
export PKGLOG_DIR=$LFSLOG/12.08
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../colord-1.4.7-upstream_fixes-1.patch        \
        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

groupadd -g 71 colord &&
useradd -c "Color Daemon Owner" -d /var/lib/colord -u 71    \
        -g colord -s /bin/false colord

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr               \
            --buildtype=release         \
            -D daemon_user=colord       \
            -D vapi=true                \
            -D systemd=false            \
            -D libcolordcompat=true     \
            -D argyllcms_sensor=false   \
            -D bash_completion=false    \
            -D docs=false               \
            -D man=false                \
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

echo "5. Ninja Test ..."
echo "5. Ninja Test ..." >> $LFSLOG_PROCESS
echo "5. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
