# e10.44.01.FFmpeg-7.1.sh
#

#
# Dependencies Recommended:
#
#               e10.42.24 libaom-3.12.0
#               e10.42.25 libass-0.17.3
#               e10.42.09 fdk-aac-2.0.3
#               d10.10.04 FreeType-2.13.3
#               e10.43.04 LAME-3.100
#               e10.42.44 libvorbis-1.3.7
#               e10.42.45 libvpx-1.15.0
#               e10.42.47 Opus-1.5.2
#               e10.42.59 x264-20250212
#               e10.42.60 x265-4.1
#               e10.13.17 NASM-2.16.03
#            or e10.13.38 yasm-1.3.0
#
# Dependencies Recommended for desktop use:
#
#               e10.42.01 alsa-lib-1.2.13
#               d20.42.41 libva-2.22.0
#               e10.42.52 SDL2-2.30.11
#
# Dependencies Recommended for systems with Intel Video:
#
#               d20.42.42 libvdpau-1.5              PCs
#               d20.42.43 libvdpau-va-gl-0.4.2      PCs
#
#
# Dependencies Optional:
#
#               d10.10.05  Fontconfig-2.16.0
#               e10.10.06  FriBidi-1.0.16
#               d20.25.33  Libdrm-2.4.124
#               e10.10.19  libjxl-0.11.1
#               e10.10.27  libwebp-1.5.0
#               e10.10.31  OpenJPEG-2.5.3
#               a.08.91.63 GnuTLS-3.8.9
#               e10.42.49  PulseAudio-17.0
#               e10.42.55  Speex-1.2.1
#               d20.25.44  Vulkan-Loader-1.4.304    PCs
#               d20.24.xx  Graphical Environment
#

#
# Required by:
#
#               e41.42.18 gst-libav-2.26.3     (errata)
#
# Optionally by:
#
#               g22.40.03 Firefox-128.11.0esr
#               e41.42.48 Pipewire-1.2.7
#

export PKG="ffmpeg-7.1"
export PKGLOG_DIR=$LFSLOG/44.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


patch -Np1 -i ../ffmpeg-7.1-chromium_method-1.patch \
    > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -e 's/X265_BUILD >= 210/(&) \&\& (X265_BUILD < 213)/'   \
    -i libavcodec/libx265.c                                 \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

patch -Np1 -i ../ffmpeg-7.1-texinfo_fix-1.patch     \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --enable-gpl            \
            --enable-version3       \
            --enable-nonfree        \
            --disable-static        \
            --enable-shared         \
            --disable-debug         \
            --enable-libaom         \
            --enable-libass         \
            --enable-libfdk-aac     \
            --enable-libfreetype    \
            --enable-libmp3lame     \
            --enable-libopus        \
            --enable-libvorbis      \
            --enable-libvpx         \
            --enable-libx264        \
            --enable-libx265        \
            --enable-openssl        \
            --enable-libdrm         \
            --enable-libpulse       \
            --ignore-tests=enhanced-flv-av1     \
            --docdir=/usr/share/doc/ffmpeg-7.1  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Build QuickTime ..."
echo "4. Build QuickTime ..." >> $LFSLOG_PROCESS
echo "4. Build QuickTime ..." >> $PKGLOG_ERROR
gcc tools/qt-faststart.c -o tools/qt-faststart  \
    >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m755    tools/qt-faststart /usr/bin         \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m755 -d           /usr/share/doc/ffmpeg-7.1 \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644    doc/*.txt /usr/share/doc/ffmpeg-7.1 \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# test requires rsync-3.4.1 (not installed)


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset SOURCES
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
