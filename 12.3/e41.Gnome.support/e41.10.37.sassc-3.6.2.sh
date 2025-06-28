# e41.10.37.sassc-3.6.2.sh
#

#
# Required by:
#
#               e41.25.28 libadwaita-1.6.4
#

export PKG="sassc-3.6.2"
export PKGLOG_DIR=$LFSLOG/10.37
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
 

tar -vxf ../libsass-3.6.6.tar.gz    \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

pushd libsass-3.6.6

    autoreconf -fvi > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

    echo "2. Configure libsass ..."
    echo "2. Configure libsass ..." >> $LFSLOG_PROCESS
    echo "2. Configure libsass ..." >> $PKGLOG_ERROR
    ./configure --prefix=/usr       \
                --disable-static    \
                >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

    echo "3. Make Build libsass ..."
    echo "3. Make Build libsass ..." >> $LFSLOG_PROCESS
    echo "3. Make Build libsass ..." >> $PKGLOG_ERROR 
    make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

    echo "4. Make Install libsass ..."
    echo "4. Make Install libsass ..." >> $LFSLOG_PROCESSs
    echo "4. Make Install libsass ..." >> $PKGLOG_ERROR
    make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

popd

autoreconf -fvi \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "2. Configure sassc ..."
echo "2. Configure sassc ..." >> $LFSLOG_PROCESS
echo "2. Configure sassc ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build sassc ..."
echo "3. Make Build sassc ..." >> $LFSLOG_PROCESS
echo "3. Make Build sassc ..." >> $PKGLOG_ERROR 
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install sassc ..."
echo "4. Make Install sassc ..." >> $LFSLOG_PROCESSs
echo "4. Make Install sassc ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
