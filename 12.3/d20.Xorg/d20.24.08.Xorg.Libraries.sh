# d20.24.08.Xorg.Libraries.sh
#

#
# Dependencies Required:
#
#               d10.10.05 Fontconfig-2.16.0
#               d20.24.07 libxcb-1.17.0
#
# Dependencies Optional:
#
#               d10.49.06  xmlto-0.0.29
#

#
# Required by:
#
#               d20.24.12 Mesa-24.3.4
#               d20.24.18 XKeyboardConfig-2.44
#               d20.24.24 xclock-1.1.1
#               d20.24.25 xinit-1.4.3
#               d20.42.42 libvdpau-1.5
#               e11.25.03 at-spi2-core-2.54.1
#               e10.25.10 gdk-pixbuf-xlib-2.42.12
#               e11.25.42 startup-notification-0.12
#               e11.25.36 libxklavier-5.4
#               e11.33.17 libgtop-2.41.3
#               e12.25.40 Qt-6.9.1          (errata/svn)
#               e32.37.02 kwindowsystem-6.11.0 for lxqt
#
# Recommended by:
#
#               d20.25.33 Libdrm-2.4.124
#               d20.12.11 dbus-1.16.0.Pass2 ( dbus-launch )
#				e10.25.04 Cairo-1.18.2
#               e10.25.37 Pango-1.56.1
#               e10.42.49 PulseAudio-17.0
#               e10.42.52 SDL2-2.30.11
#               e41.42.15 gst-plugins-base-1.26.3   (errata)
#
# Optionally by:
#
#               e41.42.48 Pipewire-1.2.7
#

#
# based on: https://www.linuxfromscratch.org/blfs/view/12.3/x/x7lib.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

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
