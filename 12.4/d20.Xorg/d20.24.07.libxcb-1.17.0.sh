# d20.24.07.libxcb-1.17.0.sh
#

#
# Dependencies Required:
#
#               d20.24.04 libXau-1.0.12
#               d20.24.06 xcb-proto-1.17.0
#
# Dependencies Recommended:
#
#               d20.24.05 libXdmcp-1.1.5
#
# Optional:
#
#               a.08.91.38 libxslt-1.1.43
#

#
# Required by:
#
#               d20.24.08 Xorg Libraries
#               d20.24.10 xcb-util-0.4.1
#               d20.24.11 XCB Utilities
#
# Recommended by:
#
#               d20.09.73 libxkbcommon-1.11.0
#               e10.09.73 libxkbcommon-1.11.0
#
# Optionally by:
#
#               e41.42.48 Pipewire-1.2.7
#


export PKG="libxcb-1.17.0"
export PKGLOG_DIR=$LFSLOG/24.07
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure $XORG_CONFIG        \
            --without-doxygen   \
            --docdir='${datadir}'/doc/libxcb-1.17.0 \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#PYTHON=python3                          \

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
LC_ALL=en_US.UTF-8  \
    make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
