# d10.10.04.FreeType-2.13.3.Pass1.sh
#

#
# Dependencies Recommended:
#
#               d10.10.22  libpng-1.6.50
#               a.08.91.03 Which-2.23
#
# Dependencies Optional:
#
#               a.08.91.22 brotli-1.1.0
#

#
# Recommended by:
#
#               d10.10.12 harfBuzz-11.4.1
#
# Optionally by:
#
#               d10.10.11 Graphite2-1.3.14
#

export PKG="freetype-2.13.3"
export PKGLOG_DIR=$LFSLOG/10.04.1
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


tar xvf ../freetype-doc-2.13.3.tar.xz   \
    --strip-components=2 -C docs        \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:"         \
    -i include/freetype/config/ftoption.h           \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr               \
            --enable-freetype-config    \
            --disable-static            \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

#cp -v -R docs -T /usr/share/doc/freetype-2.13.3 \
#        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
#rm -v /usr/share/doc/freetype-2.13.3/freetype-config.1  \
#        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
# rm -rf $PKG           remove on Pass 2
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
