# e11.49.05.itstool-2.0.7.sh
#

#
# Dependencies Required:
#
#               a.08.91.36 docbook-xml-4.5
#

#
# Required by:
#
#               f2.26.02  lightdm-1.32.0
#               g42.34.04 Evince-46.3.1
#               e44.34.04 Evince-46.3.1
#               e41.09.02 AppStream-1.0.5   (errata)
#               e42.33.08 yelp-xsl-42.4     (errata)
#               e42.33.12 gnome-desktop-44.1
#               e43.33.46 gnome-user-docs-47.2
#               e44.34.01 Baobab-47.0
#               e44.34.06 File-Roller-44.5
#               e44.34.07 gnome-calculator-47.1
#               e44.34.08 gnome-color-manager-3.36.2
#               e44.34.09 gnome-connections-46.0
#               e44.34.10 gnome-disk-utility-46.1
#               e44.34.12 gnome-nettool-42.0
#               e44.34.15 gnome-system-monitor-47.1
#               e44.34.16 gnome-terminal-3.54.2
#               e44.34.18 Gucharmap-16.0.2
#               ???.11.07 GTK-Doc-1.33.2
#

export PKG="itstool-2.0.7"
export PKGLOG_DIR=$LFSLOG/49.05
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i 's/re.sub(/re.sub(r/'         itstool.in \
         > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -i 's/re.compile(/re.compile(r/' itstool.in \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
PYTHON=/usr/bin/python3     \
./configure --prefix=/usr   \
         > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
