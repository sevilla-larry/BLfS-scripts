# g11.09.06.Aspell-0.60.8.1.sh
#

#
# Dependencies Required:
#
#               a.08.91.03 Which-2.23
#

#
# Recommended by:
#
#               g11.09.13 enchant-2.8.2
#

export PKG="aspell-0.60.8.1"
export PKGLOG_DIR=$LFSLOG/09.06
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
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

ln -svfn aspell-0.60 /usr/lib/aspell                \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m755 -d /usr/share/doc/aspell-0.60.8.1/aspell{,-dev}.html   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m644 manual/aspell.html/*               \
    /usr/share/doc/aspell-0.60.8.1/aspell.html      \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m644 manual/aspell-dev.html/*           \
    /usr/share/doc/aspell-0.60.8.1/aspell-dev.html  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m 755 scripts/ispell    /usr/bin/       \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m 755 scripts/spell     /usr/bin/       \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# Setup Dictionary

echo "5. Extract Dictionary tar..."
echo "5. Extract Dictionary tar..." >> $LFSLOG_PROCESS
echo "5. Extract Dictionary tar..." >> $PKGLOG_ERROR
tar vxf ../aspell6-en-2020.12.07-0.tar.bz2  \
        >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

cd aspell6-en-2020.12.07-0

echo "6. Configure Dictionary ..."
echo "6. Configure Dictionary ..." >> $LFSLOG_PROCESS
echo "6. Configure Dictionary ..." >> $PKGLOG_ERROR
./configure >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "7. Make Build Dictionary ..."
echo "7. Make Build Dictionary ..." >> $LFSLOG_PROCESS
echo "7. Make Build Dictionary ..." >> $PKGLOG_ERROR
make >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "8. Make Install Dictionary ..."
echo "8. Make Install Dictionary ..." >> $LFSLOG_PROCESS
echo "8. Make Install Dictionary ..." >> $PKGLOG_ERROR
make install >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
