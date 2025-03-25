# b30.13.23.30.Requests-2.32.3.sh
#

#
# Dependencies Required:
#
#               b30.13.24.06 Charset-normalizer-3.3.2
#               b30.13.24.12 Idna-3.7
#               b30.13.24.34 Urllib3-2.2.2
#
# Dependencies Recommended:
#
#               a.08.91C.make-ca-1.14.sh
#               a.08.91B.p11-kit-0.25.5.sh
#
#
# Dependencies Optional:
#
#               b10.13.23.26 Pytest-8.3.2
#

#
# Required by:
#
#               i020.9.04 keystoneauth1-5.8.0
#               i040.9.03 osc-lib-3.1.0
#               i030.9.03 oslo.config-9.6.0
#               i040.9.11 python-keystoneclient-5.5.0
#               i040.9.12 python-cinderclient-9.6.0
#               i040.9.13 python-glanceclient-4.7.0
#               i040.9.14 python-barbicanclient-7.0.0
#               i040.9.15 python-neutronclient-11.3.1
#               i050.9.1  python-openstackclient-7.1.3
#               i080.9.08 oslo.policy-4.4.0
#               i070.9.02 castellan-5.1.1
#               i090.9.02 keystonemiddleware-10.7.1
#               i090.9.03 osprofiler-4.2.0
#               i090.9.06 glance_store-4.8.1
#               i090.9.11 os_brick-6.9.1
#               i095.9.14 pysaml2-7.5.0
#               i095.9.26 websockify-0.12.0
#

export PKG="requests-2.32.3"
export PKGLOG_DIR=$LFSLOG/13.23.30
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../requests-2.32.3-use_system_certs-1.patch   \
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


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
