# d20.24.08.Xorg.Libraries.sh
#

#
# Dependencies Required:
#
#               d10.10.05 Fontconfig-2.15.0
#               d20.24.07 libxcb-1.17.0
#

#
# Required by:
#
#               d20.24.16 Mesa-24.1.5
#               24.21 XKeyboardConfig-2.39          ???
#               24.27 xclock-1.1.1                  ???
#               24.28 xinit-1.4.2                   ???
#               25.02 at-spi2-core-2.48.3           ???
#               25.13 gdk-pixbuf-xlib-2.40.2        ???
#
# Recommended by:
#
#               d10.25.35 Libdrm-2.4.122
#               d10.12.10 dbus-1.14.10 ( dbus-launch )
#               25.43 Pango-1.50.14                 ???
#
#
# based on: https://www.linuxfromscratch.org/blfs/view/12.2/x/x7lib.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

cd lib


# bash -e

I=0

for package in $(grep -v '^#' ../lib-7.md5 | awk '{print $2}')
do
  ((I++))

  strI=$(echo $I | awk '{printf("%02d",$1)}')

  export PKGLOG_DIR=$LFSLOG/24.08/$strI
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

    docdir="--docdir=$XORG_PREFIX/share/doc/$packagedir"

    echo "2. Configure ... $strI $package"
    echo "2. Configure ... $strI $package" >> $LFSLOG_PROCESS
    echo "2. Configure ... $strI $package" >> $PKGLOG_ERROR

    case $packagedir in
      libXfont2-[0-9]* )
        ./configure $XORG_CONFIG  \
                    $docdir       \
                    --disable-devel-docs     \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
      ;;

      libXt-[0-9]* )
        ./configure $XORG_CONFIG  \
                    $docdir       \
                    --with-appdefaultdir=/etc/X11/app-defaults  \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
      ;;

      libXpm-[0-9]* )
        ./configure $XORG_CONFIG  \
                    $docdir       \
                    --disable-open-zfile     \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
      ;;
      
      libpciaccess* )
          mkdir build
          cd    build

              echo "2. Meson Setup ... $strI $package"
              echo "2. Meson Setup ... $strI $package" >> $LFSLOG_PROCESS
              echo "2. Meson Setup ... $strI $package" >> $PKGLOG_ERROR
              meson setup   \
                    --prefix=$XORG_PREFIX   \
                    --buildtype=release     \
                    ..  \
              > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

              echo "3. Ninja Build ... $strI $package"
              echo "3. Ninja Build ... $strI $package" >> $LFSLOG_PROCESS
              echo "3. Ninja Build ... $strI $package" >> $PKGLOG_ERROR
              ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

              echo "4. Ninja Test ... $strI $package"
              echo "4. Ninja Test ... $strI $package" >> $LFSLOG_PROCESS
              echo "4. Ninja Test ... $strI $package" >> $PKGLOG_ERROR
              ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

              echo "5. Ninja Install ... $strI $package"
              echo "5. Ninja Install ... $strI $package" >> $LFSLOG_PROCESS
              echo "5. Ninja Install ... $strI $package" >> $PKGLOG_ERROR
              ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
              #as_root ninja install

          popd     # $packagedir

          continue # for loop
      ;;

      * )
        ./configure $XORG_CONFIG  \
                    $docdir       \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
      ;;
    esac

    echo "3. Make Build ... $strI $package"
    echo "3. Make Build ... $strI $package" >> $LFSLOG_PROCESS
    echo "3. Make Build ... $strI $package" >> $PKGLOG_ERROR
    make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

    echo "4. Make Check ... $strI $package"
    echo "4. Make Check ... $strI $package" >> $LFSLOG_PROCESS
    echo "4. Make Check ... $strI $package" >> $PKGLOG_ERROR
    make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
    #make check 2>&1 | tee ../$packagedir-make_check.log

    echo "5. Make Install ... $strI $package"
    echo "5. Make Install ... $strI $package" >> $LFSLOG_PROCESS
    echo "5. Make Install ... $strI $package" >> $PKGLOG_ERROR
    make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
    #as_root make install

  popd

  rm -rf $packagedir
  /sbin/ldconfig
  #as_root /sbin/ldconfig

done

#exit


cd ..
unset I strI
unset package packagedir
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR
