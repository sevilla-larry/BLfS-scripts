# e43.33.47.Yelp-42.2.sh
#

#                        
#
# Dependencies Required:
#
#               xxx.xx.xx gsettings-desktop-schemas-47.1 
#               xxx.xx.xx WebKitGTK-2.46.6
#               xxx.xx.xx yelp-xsl-42.1
#
# Dependencies Recommended:
#
#               xxx.xx.xx desktop-file-utils-0.28

# Required by:
#
#

export PKG="yelp-42.2"
export PKGLOG_DIR=$LFSLOG/33.47
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
autoreconf -fiv                 \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
    ./configure --prefix=/usr           \
                --disable-static        \
                ..                      \
           >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
