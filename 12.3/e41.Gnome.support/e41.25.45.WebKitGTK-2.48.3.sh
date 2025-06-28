# e41.25.45.WebKitGTK-2.48.3.sh
# errata
# GTK-4 versioin
#

#
# Dependencies Required:
#
#               e10.25.04  Cairo-1.18.2
#               a.08.9x.?1 CMake-3.31.5
#               e41.42.14  gst-plugins-base-1.26.2   (errata)
#               e41.42.16  gst-plugins-bad-1.26.2    (errata)
#               e11.25.16  GTK-3.24.48
#               e41.25.17  GTK-4.16.12
#               a.08.91.07 icu-76.1
#               e10.10.14  LittleCMS-2.17
#               e10.09.45  libgudev-238
#               e42.33.04  libsecret-0.21.6
#               e41.17.18  libsoup-3.6.5             (errata)
#               a.08.91.33 libtasn1-4.20.0
#               e11.10.27  libwebp-1.5.0
#               d20.24.12  Mesa-24.3.4
#               e10.10.31  OpenJPEG-2.5.3
#               e41.13.26  Ruby-3.4.2
#               a.08.91.18 SQLite-3.49.1
#               e41.13.35  unifdef-2.12
#               a.08.91.03 Which-2.23
#
# 
# Dependencies Recommended:
#
#               e13.12.07  bubblewrap-0.11.0
#               e11.09.13  enchant-2.8.2
#               e41.17.03  GeoClue-2.7.2
#               d10.09.17  GLib-2.82.5
#               e10.28.07  hicolor-icon-theme-0.18
#               e41.10.15  libavif-1.2.0
#               e41.10.19  libjxl-0.11.1
#               a.08.91.21 libseccomp-2.6.0
#               e41.11.22  xdg-dbus-proxy-0.1.6
#
# Dependencies Optional:
#
#               d10.10.12 harfBuzz-10.4.0
#               d10.09.97 Wayland-1.23.0
#

#
# Required by:
#
#               e43.33.47 Yelp-42.3
#
# Recommended by:
#
#               e42.33.21 evolution-data-server-3.54.3
#

export PKG="webkitgtk-2.48.3"
export PKGLOG_DIR=$LFSLOG/25.45
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_BUILD_TYPE=Release       \
      -D CMAKE_INSTALL_PREFIX=/usr      \
      -D CMAKE_SKIP_INSTALL_RPATH=ON    \
      -D CMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" \
      -D PORT=GTK                       \
      -D LIB_INSTALL_DIR=/usr/lib       \
      -D USE_LIBBACKTRACE=OFF           \
      -D USE_LIBHYPHEN=OFF              \
      -D ENABLE_GAMEPAD=OFF             \
      -D ENABLE_MINIBROWSER=ON          \
      -D ENABLE_DOCUMENTATION=OFF       \
      -D USE_WOFF2=OFF                  \
      -D USE_GTK4=ON                    \
      -D ENABLE_JOURNALD_LOG=OFF        \
      -D ENABLE_BUBBLEWRAP_SANDBOX=ON   \
      -D USE_SYSPROF_CAPTURE=NO         \
      -D ENABLE_GEOLOCATION=OFF         \
      -W no-dev                         \
      -G Ninja                          \
      ..                                \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -vdm755 /usr/share/gtk-doc/html             \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -rv ../Documentation/* /usr/share/gtk-doc/html   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
