# b10.11.21.unixODBC-2.3.12.sh
#

#
# Recommended by:
#
#               g22.39.03 LibreOffice-25.2.3
#
# Optionally by:
#
#               c11.22.03 MariaDB-11.8.3
#               c13.09.05 Apr-Util-1.6.3
#

export PKG="unixODBC-2.3.12"
export PKGLOG_DIR=$LFSLOG/11.21
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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
./configure --prefix=/usr               \
            --sysconfdir=/etc/unixODBC  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

#find doc -name "Makefile*" -delete                  \
#            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
#chmod -v 644 doc/{lst,ProgrammerManual/Tutorial}/*  \
#            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
#
#install -v -m755 -d /usr/share/doc/unixODBC-2.3.12  \
#            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
#cp      -v -R doc/* /usr/share/doc/unixODBC-2.3.12  \
#            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
