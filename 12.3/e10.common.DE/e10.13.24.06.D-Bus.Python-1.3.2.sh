# e10.13.24.06.D-Bus.Python-1.3.2.sh
#

#
# Dependencies Required:
#
#               d20.12.11     dbus-1.16.0
#               d10.09.17     GLib-2.82.5
#               a.08.91.20.13 Meson_python-0.17.1
#               a.08.91.05    Patchelf-0.18.0
#

#
# Optionally (for the integraion tests) by:
#
#               e10.12.35 UDisks-2.10.1     (errata sed)
#
# Optionally by:
#
#               e41.11.10 ibus-1.5.31
#

export PKG="dbus-python-1.3.2"
export PKGLOG_DIR=$LFSLOG/13.24.06
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. pip3 Build ..."
echo "2. pip3 Build ..." >> $LFSLOG_PROCESS
echo "2. pip3 Build ..." >> $PKGLOG_ERROR
pip3 wheel  -w dist                 \
            --no-cache-dir          \
            --no-build-isolation    \
            --no-deps               \
            $PWD                    \
            > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. pip3 Install ..."
echo "3. pip3 Install ..." >> $LFSLOG_PROCESS
echo "3. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index          \
                --no-user           \
                --find-links dist   \
                --no-cache-dir      \
                dbus-python         \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
