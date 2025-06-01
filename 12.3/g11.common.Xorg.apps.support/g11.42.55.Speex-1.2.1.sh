# g11.42.55.Speex-1.2.1.sh
#

#
# Dependencies Required:
#
#               e10.42.37 libogg-1.3.5
#

#
# Recommended by:
#
#               g11.42.49 PulseAudio-17.0
#
# Optionally by:
#
#               g11.42.40 libsndfile-1.2.2
#

export PKG1="speex-1.2.1"
export PKGLOG_DIR=$LFSLOG/42.55
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract main tar..."
echo "1. Extract main tar..." >> $LFSLOG_PROCESS
echo "1. Extract main tar..." >> $PKGLOG_ERROR
tar xvf $PKG1.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG1


echo "2. Configure main ..."
echo "2. Configure main ..." >> $LFSLOG_PROCESS
echo "2. Configure main ..." >> $PKGLOG_ERROR
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/speex-1.2.1 \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build main ..."
echo "3. Make Build main ..." >> $LFSLOG_PROCESS
echo "3. Make Build main ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install main ..."
echo "4. Make Install main ..." >> $LFSLOG_PROCESS
echo "4. Make Install main ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cd ..

echo "........." >> $PKGLOG_ERROR
echo "...DSP..." >> $PKGLOG_ERROR
echo "........." >> $PKGLOG_ERROR

echo "........." >> $PKGLOG_TAR
echo "...DSP..." >> $PKGLOG_TAR
echo "........." >> $PKGLOG_TAR

echo "........." >> $PKGLOG_CONFIG
echo "...DSP..." >> $PKGLOG_CONFIG
echo "........." >> $PKGLOG_CONFIG

echo "........." >> $PKGLOG_BUILD
echo "...DSP..." >> $PKGLOG_BUILD
echo "........." >> $PKGLOG_BUILD

echo "........." >> $PKGLOG_INSTALL
echo "...DSP..." >> $PKGLOG_INSTALL
echo "........." >> $PKGLOG_INSTALL

echo "5. Extract dsp tar..."
echo "5. Extract dsp tar..." >> $LFSLOG_PROCESS
echo "5. Extract dsp tar..." >> $PKGLOG_ERROR
tar xvf $PKG2.tar.gz >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG2

echo "6. Configure dsp ..."
echo "6. Configure dsp ..." >> $LFSLOG_PROCESS
echo "6. Configure dsp ..." >> $PKGLOG_ERROR
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/speexdsp-1.2.1  \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "7. Make Build dsp ..."
echo "7. Make Build dsp ..." >> $LFSLOG_PROCESS
echo "7. Make Build dsp ..." >> $PKGLOG_ERROR
make >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "8. Make Install dsp ..."
echo "8. Make Install dsp ..." >> $LFSLOG_PROCESS
echo "8. Make Install dsp ..." >> $PKGLOG_ERROR
make install >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG1
rm -rf $PKG2
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
