# e10.10.08.giflib-5.2.2.sh
# Xfce LXQt Gnome KDE
# errata patch
#

#
# Dependencies Optional:
#
#               d10.49.06 xmlto-0.0.29
#

#
# Recommended by:
#
#               e10.10.19 libjxl-0.11.1
#               e42.33.23 localsearch-3.8.2
#
# Optionally by:
#
#               e10.10.27 libwebp-1.5.0
#

export PKG="giflib-5.2.2"
export PKGLOG_DIR=$LFSLOG/10.08
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../giflib-5.2.2-upstream_fixes-1.patch    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

patch -Np1 -i ../giflib-5.2.2-security_fixes-1.patch    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cp -v pic/gifgrid.gif doc/giflib-logo.gif               \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Check ..."
echo "3. Make Check ..." >> $LFSLOG_PROCESS
echo "3. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make PREFIX=/usr install    \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -fv /usr/lib/libgif.a    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

find doc \( -name Makefile\* -o -name \*.1      \
         -o -name \*.xml \) -exec rm -v {} \;   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -v -dm755 /usr/share/doc/giflib-5.2.2   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v -R doc/* /usr/share/doc/giflib-5.2.2      \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
