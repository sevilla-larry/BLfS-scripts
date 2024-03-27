# c.25.19.GTK+-2.24.33.sh
#
# Dependencies Required:
#
#               25.02 at-spi2-core-2.48.3
#               25.12 gdk-pixbuf-2.42.10
#               25.43 Pango-1.50.14
#
# Dependencies Recommended:
#
#               28.07 hicolor-icon-theme-0.17
#
# Dependencies Optional:
#
#               09.16 gobject-introspection-1.76.1
#
#
# Required by:
#
#               37.04 libfm-1.3.2
#               37.06 libwnck-2.30.7
#               37.08 LXAppearance-0.6.3
#               25.31 keybinder-0.3.1
#               etc
#

export PKG="gtk+-2.24.33"
export PKGLOG_DIR=$LFSLOG/25.19
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


sed -e 's#l \(gtk-.*\).sgml#& -o \1#' \
    -i docs/{faq,tutorial}/Makefile.in

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

#
# To test the results, issue: make -k check.
# Note that you must run the tests from a session
# with X Window Display capability
# (i.e., not a text-based terminal/console)
# as the tests attempt to open an X window,
# and the tests can take an excessively long time.
#
# echo "?. Make Check ..."
# echo "?. Make Check ..." >> $LFSLOG_PROCESS
# echo "?. Make Check ..." >> $PKGLOG_ERROR
# make -k test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
#

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
