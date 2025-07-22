# g22.40.03.Firefox-140.0esr.sh
# (errata)
#

#
# Dependencies Required:
#
#               e10.13.02  Cbindgen-0.28.0
#               e11.25.16  GTK-3.24.48
#               e11.25.35  libnotify-0.8.4
#               a.08.91.12 libarchive-3.8.1 (errata)
#               d10.13.13  LLVM-19.1.7
#               g11.09.80  Node.js-22.14.0
#               e10.42.49  PulseAudio-17.0
#               a.08.91.19 Python-3.1{2,3}.x
#               e11.25.42  startup-notification-0.12
#
# Dependencies Recommended:
#
#               a.08.91.07 icu-76.1
#               a.08.91.14 libevent-2.1.12
#               e10.42.45  libvpx-1.15.2    (errata)
#               e10.10.27  libwebp-1.5.0
#               e10.13.17  NASM-2.16.03
#               a.08.91.32 NSS-3.108
#
# Dependencies Optional:
#
#               a.08.93.04 cURL-8.14.1      (errata)
#               e10.44.01  FFmpeg-7.1       (runtime)
#               a.08.91.71 pciutils-3.13.0
#               a.08.93.02 WGet-1.25.0
#               e10.13.38  yasm-1.3.0
#

export PKG="firefox-140.0"
export PKG0=$PKG"esr.source"
export PKGLOG_DIR=$LFSLOG/40.03
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
tar xvf $PKG0.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


cat > mozconfig << "EOF" 2>> $PKGLOG_ERROR
# If you have a multicore machine, all cores will be used by default.

# If you have installed (or will install) wireless-tools, and you wish
# to use geolocation web services, comment out this line
ac_add_options --disable-necko-wifi

# Comment out the following line if you wish not to use Google's Location
# Service (GLS).  Note that if Geoclue is installed and configured to use
# GLS (as the BLFS instruction does), Firefox can access GLS via Geoclue
# anyway.  On the other hand if Geoclue is not installed (or not properly
# configured) and this line is commented out, the website requiring a
# location service will not function properly.
#ac_add_options --with-google-location-service-api-keyfile=$PWD/google-key
#  Initially NO GLS

# startup-notification is required since firefox-78

# Uncomment the following option if you have not installed PulseAudio and
# want to use alsa instead
#ac_add_options --enable-audio-backends=alsa

# Comment out following options if you have not installed
# recommended dependencies:
ac_add_options --with-system-icu
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-webp

# The libdav1d library (av1 decoder) requires nasm. Uncomment this
# if nasm has not been installed. Do not uncomment this if you have
# ffmpeg installed.
#ac_add_options --disable-av1

# You cannot distribute the binary if you do this.
ac_add_options --enable-official-branding

# Stripping is now enabled by default.
# Uncomment these lines if you need to run a debugger:
#ac_add_options --disable-strip
#ac_add_options --disable-install-strip

# Disabling debug symbols makes the build much smaller and a little
# faster. Comment this if you need to run a debugger.
ac_add_options --disable-debug-symbols

# The BLFS editors recommend not changing anything below this line:
ac_add_options --prefix=/usr
ac_add_options --enable-application=browser
ac_add_options --disable-crashreporter
ac_add_options --disable-updater

# Enabling the tests will use a lot more space and significantly
# increase the build time, for no obvious benefit.
ac_add_options --disable-tests

# This enables SIMD optimization in the shipped encoding_rs crate.
ac_add_options --enable-rust-simd

ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman

ac_add_options --with-system-jpeg
ac_add_options --with-system-png
ac_add_options --with-system-zlib

# Sandboxing works well on x86_64 but might cause issues on other
# platforms, e.g. i686.
[ $(uname -m) != x86_64 ] && ac_add_options --disable-sandbox

# Using sandboxed wasm libraries has been moved to all builds instead
# of only mozilla automation builds. It requires extra llvm packages
# and was reported to seriously slow the build. Disable it.
ac_add_options --without-wasm-sandboxed-libraries

# The following option unsets Telemetry Reporting. With the Addons Fiasco,
# Mozilla was found to be collecting user's data, including saved passwords and
# web form data, without users consent. Mozilla was also found shipping updates
# to systems without the user's knowledge or permission.
# As a result of this, use the following command to permanently disable
# telemetry reporting in Firefox.
unset MOZ_TELEMETRY_REPORTING

mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/firefox-build-dir

# By default firefox will attempt to use the window class firefox-default on
# launch. This makes the icon not work properly because wayland does not
# support the X11 property  class header. Change the remoting name to fix this.
# This is also reflected in the .desktop file where StartupWMClass is set to
# firefox.
MOZ_APP_REMOTINGNAME=firefox
EOF

# ICU was installed
# for i in {43..47}; do
#   sed -i '/ZWJ/s/}/,CLASS_CHARACTER&/' intl/lwbrk/LineBreaker.cpp  \
#        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# done

# sed -i 's/icu-i18n/icu-uc &/' js/moz.configure  \
#        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# if GLS was installed
# echo "AIzaSyDxKL42zsPjbke5O8_rPVpVrLrJ8aeE9rQ" > google-key

echo "2. Mach Build ..."
echo "2. Mach Build ..." >> $LFSLOG_PROCESS
echo "2. Mach Build ..." >> $PKGLOG_ERROR
export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
export MOZBUILD_STATE_PATH=${PWD}/mozbuild
./mach build > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# disable tests

echo "3. Mach Install ..."
echo "3. Mach Install ..." >> $LFSLOG_PROCESS
echo "3. Mach Install ..." >> $PKGLOG_ERROR
export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
./mach install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

unset MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE
unset MOZBUILD_STATE_PATH

# Configuring Firefox

mkdir -pv /usr/share/applications   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mkdir -pv /usr/share/pixmaps        \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

MIMETYPE="text/xml;text/mml;text/html;"
MIMETYPE+="application/xhtml+xml;application/vnd.mozilla.xul+xml;"
MIMETYPE+="x-scheme-handler/http;x-scheme-handler/https"

cat > /usr/share/applications/firefox.desktop << EOF    2>> $PKGLOG_ERROR
[Desktop Entry]
Encoding=UTF-8
Name=Firefox Web Browser
Comment=Browse the World Wide Web
GenericName=Web Browser
Exec=firefox %u
Terminal=false
Type=Application
Icon=firefox
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=$MIMETYPE
StartupNotify=true
StartupWMClass=firefox
EOF

unset MIMETYPE

ln -sfv /usr/lib/firefox/browser/chrome/icons/default/default128.png    \
        /usr/share/pixmaps/firefox.png                                  \
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
unset PKG0
