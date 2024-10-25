# e11.10.24.librsvg-2.58.3.sh
#

#
# Dependencies Required:
#
#               e10.25.04 Cairo-1.18.0
#               e10.25.10 gdk-pixbuf-2.42.12
#               e10.25.38 Pango-1.54.0
#               e11.13.26 Rustc-1.80.1
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.80.4
#
# Dependencies Optional:
#
#               d20.24.21 Xorg Fonts
#

export PKG="librsvg-2.58.3"
export PKGLOG_DIR=$LFSLOG/10.24
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            --disable-static    \
            --disable-gtk-doc   \
            --docdir=/usr/share/doc/librsvg-2.58.3 \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#            --enable-vala    \

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
cargo update --precise 0.3.36 time  \
             > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
LC_ALL=C make check -k              \
            >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
#make DOC_INSTALL_DIR='$(docdir)' install  \
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
