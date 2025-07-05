# e41.13.24.23.PyGObject-3.50.0.sh
#

#
# Dependencies Required:
#
#               d10.09.17 GLib-2.80.4
#
# Dependencies Recommended:
#
#               e41.13.24.20 PyCairo-1.26.1
#
# Dependencies Optional:
#
#               a.08.91.20.10 Pytest-8.3.4
#

#
# Required by:
#
#               e41.25.17 GTK-4.16.12
#               e41.12.27 Power-profiles-daemon-0.30
#               e42.33.18 libgweather-4.4.4
#
# Recommended by:
#
#               e42.33.19 libpeas-1.36.0
#               e42.33.22 tinysparql-3.8.2
#
# Optionally by:
#
#               e41.09.47 libical-3.0.19
#               e41.11.10 ibus-1.5.31
#               e41.12.35 UDisks-2.10.1
#

export PKG="pygobject-3.50.0"
export PKGLOG_DIR=$LFSLOG/13.24.23
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mv -v tests/test_gdbus.py{,.nouse}          \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mv -v tests/test_overrides_gtk.py{,.nouse}  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr       \
            --buildtype=release \
            ..                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

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
