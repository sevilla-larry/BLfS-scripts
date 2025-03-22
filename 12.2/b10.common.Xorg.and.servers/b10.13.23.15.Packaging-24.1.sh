# b10.13.23.15.Packaging-24.1.sh
#

#
# Dependencies Optional:
#
#               b10.13.23.26 Pytest-8.3.2   (circular)
#

#
# Required by:
#
#               d10.09.17 GLib-2.80.4
#               b10.13.24.09 Hatchling-1.25.0
#               b10.13.24.22 Setuptools_scm-8.1.0
#               i025.9.02 oslo.utils-7.3.0
#               i030.9.11 python-keystoneclient-5.5.0
#

export PKG="packaging-24.1"
export PKGLOG_DIR=$LFSLOG/13.23.15
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. pip3 Build ..."
echo "2. pip3 Build ..." >> $LFSLOG_PROCESS
echo "2. pip3 Build ..." >> $PKGLOG_ERROR
pip3 wheel  -w dist                 \
            --no-cache-dir          \
            --no-build-isolation    \
            --no-deps               \
            $PWD                    \
            > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. pip3 Install ..."
echo "3. pip3 Install ..." >> $LFSLOG_PROCESS
echo "3. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --no-user               \
                --find-links dist       \
                --no-cache-dir          \
                packaging               \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# echo "4. pyTest ..."
# echo "4. pyTest ..." >> $LFSLOG_PROCESS
# echo "4. pyTest ..." >> $PKGLOG_ERROR
# python3 -m venv --system-site-packages testenv &&
# source testenv/bin/activate                    &&
# pip3 install pretend                           &&
# python3 /usr/bin/pytest
# deactivate


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
