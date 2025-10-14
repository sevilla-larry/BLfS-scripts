# b30.13.24.30.Requests-2.32.5.sh
#

#
# Dependencies Required:
#
#               b30.13.25.06 Charset-normalizer-3.4.3
#               b30.13.25.12 Idna-3.10
#               b30.13.25.34 Urllib3-2.5.0
#
# Dependencies Recommended:
#
#               a.08.91.40 make-ca-1.16.1
#               a.08.91.39 p11-kit-0.25.5
#
#
# Dependencies Optional:
#
#               a.08.91.20.10 Pytest-8.4.1
#

#
# Required by:
#
#               i1.1.55 pysaml2-7.5.4 whl
#               i3.2.02 osprofiler-4.2.0
#               i4.2.01 castellan-5.2.1
#               i4.2.04 glance_store-4.9.1
#               i4.1.06 keystoneauth1-5.10.0
#               i4.2.07 keystonemiddleware-10.9.0
#               i4.2.18 osc-lib-3.2.0
#               i4.1.33 oslo.config-9.7.1
#               i4.1.42 oslo.policy-4.5.1
#               i5.07   python-cinderclient-9.7.0
#               i5.16   python-keystoneclient-5.6.0
#               i8.23   python-openstackclient-7.5.0
#               i040.9.13 python-glanceclient-4.7.0
#               i040.9.14 python-barbicanclient-7.0.0
#               i040.9.15 python-neutronclient-11.3.1
#               i090.9.11 os_brick-6.9.1
#               i095.9.26 websockify-0.12.0
#

export PKG="requests-2.32.5"
export PKGLOG_DIR=$LFSLOG/13.24.30
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../requests-use_system_certs-1.patch  \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

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
                requests                \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "4. pyTest ..."
echo "4. pyTest ..." >> $LFSLOG_PROCESS
echo "4. pyTest ..." >> $PKGLOG_ERROR
python3 -m venv --system-site-packages testenv  \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
source testenv/bin/activate                     \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
pip3 install --force-reinstall sphinx\<5        \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
pip3 install pytest-mock    \
             werkzeug\<2    \
             flask\<2       \
             pytest-httpbin \
             pysocks        \
             trustme        \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
pip3 install --force-reinstall Markupsafe\<2.1  \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
python3 /usr/bin/pytest tests                   \
            >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR
deactivate  >>  $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
