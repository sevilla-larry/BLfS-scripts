# b.13.24.18.PyCairo-1.18.2.sh
#
# Dependencies Required:
#
#               25.03 Cairo-1.17.6
#               13.22 Python-2.7.18
#
#
# Required by:
#
#               13.24.22 PyGObject-2.28.7
#               13.24.24 PyGTK-2.24.0
#

export PKG="pycairo-1.18.2"
export PKGLOG_DIR=$LFSLOG/13.24.18
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Python2 Build ..."
echo "2. Python2 Build ..." >> $LFSLOG_PROCESS
echo "2. Python2 Build ..." >> $PKGLOG_ERROR
python2 setup.py build  \
        > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Python2 Install ..."
echo "3. Python2 Install ..." >> $LFSLOG_PROCESS
echo "3. Python2 Install ..." >> $PKGLOG_ERROR
python2 setup.py install --optimize=1   \
         > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
python2 setup.py install_pycairo_header \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
python2 setup.py install_pkgconfig      \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
# PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
