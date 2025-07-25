# d10.10.32.Pixman-0.44.2.sh
#

#
# Dependencies Optional:
#
#               d10.10.22 libpng-1.6.46
#						  GTK-3.24.48	( NOT installed )
#

#
# Required by:
#
#               d20.24.19 Xwayland-24.1.8		(errata)
#               d20.24.20 Xorg-Server-21.1.18	(errata)
#				e10.25.04 Cairo-1.18.2
#

export PKG="pixman-0.44.2"
export PKGLOG_DIR=$LFSLOG/10.32
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
 

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr		\
			--buildtype=release	\
			..					\
		> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

#
# test needs GTK+-3.24.48
#	which is NOT installed
#   since it will be circular
#
# GTK+-3.24.48 requires Pango-1.54.0
# Pango-1.54.0 recommends Cairo-1.18.2, Xorg
# Cairo-1.18.2 requires Pixman-0.43.4, Xorg
#
#
#echo "4. Ninja Test ..."
#echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
#echo "4. Ninja Test ..." >> $PKGLOG_ERROR
#ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
