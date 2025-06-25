# d20.24.14.Xorg.Applications.sh
#

#
# Dependencies Required:
#
#               d10.10.22 libpng-1.6.46
#               d20.24.12 Mesa-24.3.4
#               d20.24.13 xbitmaps-1.1.3
#               d20.24.10 xcb-util-0.4.1
#
# Dependencies Optional:
#
#               a.08.92.01 Linux-PAM-1.7.0
#

#
# Required by:
#
#               d20.24.15 luit-20240910
#               d20.24.16 xcursor-themes-1.0.7
#               e11.41.14 XScreenSaver-6.09
#
# Runtime Required by:
#
#               d20.24.19 Xwayland-24.1.8   (errata)
#
# Optional (required for test) by:
#
#               d20.24.18 XKeyboardConfig-2.44
#

#
# based on: https://www.linuxfromscratch.org/blfs/view/12.3/x/x7app.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

cd app


#bash -e

I=0

for package in $(grep -v '^#' ../app-7.md5 | awk '{print $2}')
do
  ((I++))

  strI=$(echo $I | awk '{printf("%02d",$1)}')

  export PKGLOG_DIR=$LFSLOG/24.14/$strI
  export PKGLOG_TAR=$PKGLOG_DIR/tar.log
  export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
  export PKGLOG_BUILD=$PKGLOG_DIR/build.log
  export PKGLOG_CHECK=$PKGLOG_DIR/check.log
  export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
  export PKGLOG_ERROR=$PKGLOG_DIR/error.log

  rm    -r $PKGLOG_DIR 2> /dev/null
  mkdir -p $PKGLOG_DIR

  packagedir=${package%.tar.?z*}

  echo "1. Extract tar... $strI $package"
  echo "1. Extract tar... $strI $package" >> $LFSLOG_PROCESS
  echo "1. Extract tar... $strI $package" >> $PKGLOG_ERROR
  tar -vxf $package > $PKGLOG_TAR 2>> $PKGLOG_ERROR

  pushd $packagedir

    echo "2. Configure ... $strI $package"
    echo "2. Configure ... $strI $package" >> $LFSLOG_PROCESS
    echo "2. Configure ... $strI $package" >> $PKGLOG_ERROR
    ./configure $XORG_CONFIG    \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

    echo "3. Make Build ... $strI $package"
    echo "3. Make Build ... $strI $package" >> $LFSLOG_PROCESS
    echo "3. Make Build ... $strI $package" >> $PKGLOG_ERROR
    make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

    echo "4. Make Install ... $strI $package"
    echo "4. Make Install ... $strI $package" >> $LFSLOG_PROCESS
    echo "4. Make Install ... $strI $package" >> $PKGLOG_ERROR
    make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
    #as_root make install

  popd

  rm -rf $packagedir

done

rm -vf $XORG_PREFIX/bin/xkeystone

#exit


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset I strI
unset package packagedir
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR
