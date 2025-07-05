# e11.09.13.enchant-2.8.2.sh
#

#
# Dependencies Required:
#
#               d10.09.17 GLib-2.82.5
#
# Dependencies Recommended:
#
#               e11.09.06 Aspell-0.60.8.1
#

#
# Required by:
#
#               g21.09.23 gspell-1.14.0
#
# Recommended by:
#
#               e41.25.45 WebKitGTK-2.46.6
#

export PKG="enchant-2.8.2"
export PKGLOG_DIR=$LFSLOG/09.13
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            --disable-static    \
            --docdir=/usr/share/doc/enchant-2.8.2   \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# test needs unittest-cpp (outside of BLfS)

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# test installation

cat > /tmp/test-enchant.txt << "EOF" 2>> $PKGLOG_ERROR
Tel me more abot linux
Ther ar so many commads
EOF

echo "5. Check Install ..."
echo "5. Check Install ..." >> $LFSLOG_PROCESS
echo "5. Check Install ..." >> $PKGLOG_ERROR
enchant-2 -d en_US -l /tmp/test-enchant.txt \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
enchant-2 -d en_US -a /tmp/test-enchant.txt \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
