# c.13.22.Python-2.7.18.sh
#
# Dependencies Recommended:
#
#               xx.xx SQLite-3.42.0 ( not installed )
#
#
# Required by:
#
#               13.24.18 PyCairo-1.18.2
#               13.24.22 PyGObject-2.28.7
#               13.24.24 PyGTK-2.24.0
#

export PKG="Python-2.7.18"
export PKGLOG_DIR=$LFSLOG/13.22
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i '/2to3/d' ./setup.py

patch -Np1 -i ../Python-2.7.18-security_fixes-1.patch

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --enable-shared         \
            --with-system-expat     \
            --with-system-ffi       \
            --enable-unicode=ucs4   \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make -k test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make altinstall > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

ln -s python2.7        /usr/bin/python2
ln -s python2.7-config /usr/bin/python2-config
chmod 755 /usr/lib/libpython2.7.so.1.0


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
