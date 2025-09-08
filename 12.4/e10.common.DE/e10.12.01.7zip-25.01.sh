# e10.12.01.7zip-25.01.sh
# errata
#

#
# Optionally by:
#
#               g42.41.12 xarchiver-0.5.4.23
#

export PKG="7zip-25.01"
export PKGLOG_DIR=$LFSLOG/12.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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
 

echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR 
for i in Bundles/{Alone,Alone7z,Format7zF,SFXCon} UI/Console; do
    make -C CPP/7zip/$i -f ../../cmpl_gcc.mak   \
        >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
done

echo "3. Install ..."
echo "3. Install ..." >> $LFSLOG_PROCESS
echo "3. Install ..." >> $PKGLOG_ERROR
install -vDm755 CPP/7zip/Bundles/Alone{/b/g/7za,7z/b/g/7zr} \
                CPP/7zip/Bundles/Format7zF/b/g/7z.so        \
                CPP/7zip/UI/Console/b/g/7z                  \
                -t /usr/lib/7zip/                           \
                >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -vm755  CPP/7zip/Bundles/SFXCon/b/g/7zCon   \
                /usr/lib/7zip/7zCon.sfx             \
                >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

(for i in 7z 7za 7zr; do
    cat > /usr/bin/$i << EOF 2>> $PKGLOG_ERROR || exit
#!/bin/sh
exec /usr/lib/7zip/$i "\$@"
EOF
    chmod -v 755 /usr/bin/$i >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR || exit
done)

cp -rv DOC -T /usr/share/doc/7zip-25.01 >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
