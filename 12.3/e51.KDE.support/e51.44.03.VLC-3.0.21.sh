# e51.44.03.VLC-3.0.21.sh
# minimal features
#

#
# Dependencies Recommended:
#
#               e10.42.01  alsa-lib-1.2.13
#               d10.11.04  desktop-file-utils-0.28
#               e10.44.01  FFmpeg-7.1
#          ???  exx.42.22  Liba52-0.8.0
#               a.08.91.35 libgcrypt-1.11.0
#          ???  exx.42.34  libmad-0.15.1b
#               b10.13.14  Lua-5.4.7
#               d20.xx     Graphical Environment
#
# Dependencies Optional features & packages:
#
#               d20.12.11  dbus-1.16.0
#               a.08.91.62 libidn2-2.3.7
#               a.08.91.68 libssh2-1.11.1
#
# Dependencies Optional input plugins:
#
#               a.08.91.12 libarchive-3.8.1
#       e10 ??? e41.42.57 v4l-utils-1.28.1
#
# Dependencies Optional mux/demux:
#
#               e10.42.37 libogg-1.3.5
#
# Dependencies Optional codec plugins:
#
#           ??? exx.42.08 FAAD2-2.11.1
#               e10.42.10 FLAC-1.5.0
#               e10.42.24 libaom-3.12.0
#               e10.42.25 libass-0.17.3
#               e51.42.35 libmpeg2-0.5.1
#               d10.10.22 libpng-1.6.46
#               d20.42.41 libva-2.22.0
#               e10.42.44 libvorbis-1.3.7
#               e10.42.47 Opus-1.5.2
#               e10.42.55 Speex-1.2.1
#               e10.42.45 libvpx-1.15.2
#               e10.42.59 x264-20250212
#
# Dependencies Optional video plugins:
#
#           ??? exx.10.01 AAlib-1.4rc5
#               d10.10.05 Fontconfig-2.16.0
#               d10.10.04 FreeType-2.13.3
#               e10.10.06 FriBidi-1.0.16
#     e10   ??? e11.10.24 librsvg-2.59.2
#               d20.42.42 libvdpau-1.5          (PC)
#               e51.42.51 sdl12-compat-1.2.68
#
# Dependencies Optional audio plugins:
#
#               e10.42.49 PulseAudio-17.0
#
# Dependencies Optional service discovery plugins:
#
#    e10    ??? e41.16.01 Avahi-0.8
#
# Dependencies Miscellaneous options:
#
#               a.08.91.63 GnuTLS-3.8.10        (errata)
#    e10    ??? e11.25.35  libnotify-0.8.4
#               a.08.91.08 libxml2-2.14.5       (errata)
#    e10    ??? e41.09.86  Protobuf-c-1.5.1
#               exx.42.56  Taglib-2.0.2
#
# Dependencies Miscellaneous options (runtime):
#
#    e10    ??? e31.41.13  xdg-utils-1.2.1
#

export PKG="vlc-3.0.21"
export PKGLOG_DIR=$LFSLOG/44.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../vlc-3.0.21-taglib-1.patch          \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
patch -Np1 -i ../vlc-3.0.21-fedora_ffmpeg7-1.patch  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
BUILDCC=gcc                         \
./configure --prefix=/usr           \
            --disable-libplacebo    \
            --disable-mad           \
            --disable-a52           \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make docdir=/usr/share/doc/vlc-3.0.21 install   \
            > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# NO GTK installed
#gtk-update-icon-cache -qtf /usr/share/icons/hicolor

update-desktop-database \
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
