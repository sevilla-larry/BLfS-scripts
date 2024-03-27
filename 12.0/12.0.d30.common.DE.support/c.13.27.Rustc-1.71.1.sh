# c.13.27.Rustc-1.71.1.sh
#
# Dependencies Required:
#
#               13.04 CMake-3.27.2
#               17.02 cURL-8.2.1
#
# Dependencies Recommended:
#
#               09.58 libssh2-1.11.0
#               13.13 LLVM-16.0.5
#
#
# Required by:
#
#               10.23 librsvg-2.56.3
#

export PKG="rustc-1.71.1"
export PKGLOG_DIR=$LFSLOG/13.27
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir -p /opt/rustc-1.71.1      &&
ln -sfn rustc-1.71.1 /opt/rustc

cat << EOF > config.toml
# see config.toml.example for more possible options
# See the 8.4 book for an old example using shipped LLVM
# e.g. if not installing clang, or using a version before 13.0

# tell x.py to not keep printing an annoying warning
changelog-seen = 2

[llvm]
# by default, rust will build for a myriad of architectures
targets = "X86"

# When using system llvm prefer shared libraries
link-shared = true

[build]
# omit docs to save time and space (default is to build them)
docs = false

# install extended tools: cargo, clippy, etc
extended = true

# Do not query new versions of dependencies online.
locked-deps = true

# Specify which extended tools (those from the default install).
tools = ["cargo", "clippy", "rustdoc", "rustfmt"]

# Use the source code shipped in the tarball for the dependencies.
# The combination of this and the "locked-deps" entry avoids downloading
# many crates from Internet, and makes the Rustc build more stable.
vendor = true

[install]
prefix = "/opt/rustc-1.71.1"
docdir = "share/doc/rustc-1.71.1"

[rust]
channel = "stable"
description = "for BLFS 12.0"

# BLFS used to not install the FileCheck executable from llvm,
# so disabled codegen tests.  The assembly tests rely on FileCheck
# and cannot easily be disabled, so those will anyway fail if
# FileCheck has not been installed.
#codegen-tests = false

[target.x86_64-unknown-linux-gnu]
# NB the output of llvm-config (i.e. help options) may be
# dumped to the screen when config.toml is parsed.
llvm-config = "/usr/bin/llvm-config"

[target.i686-unknown-linux-gnu]
# NB the output of llvm-config (i.e. help options) may be
# dumped to the screen when config.toml is parsed.
llvm-config = "/usr/bin/llvm-config"
EOF

echo "2. Python3 Build ..."
echo "2. Python3 Build ..." >> $LFSLOG_PROCESS
echo "2. Python3 Build ..." >> $PKGLOG_ERROR
{ [ ! -e /usr/include/libssh2.h ] ||
  export LIBSSH2_SYS_USE_PKG_CONFIG=1; }
python3 ./x.py build    \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Python3 Check ..."
echo "4. Python3 Check ..." >> $LFSLOG_PROCESS
echo "4. Python3 Check ..." >> $PKGLOG_ERROR
SSL_CERT_DIR=/etc/ssl/certs \
    python3 ./x.py test --verbose --no-fail-fast    \
    > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Python3 Install ..."
echo "5. Python3 Install ..." >> $LFSLOG_PROCESS
echo "5. Python3 Install ..." >> $PKGLOG_ERROR
python3 ./x.py install  \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

find /opt/rustc-1.71.1 -name "*.old" -delete

install -dm755 /usr/share/zsh/site-functions
ln -sf /opt/rustc/share/zsh/site-functions/_cargo \
        /usr/share/zsh/site-functions

cat > /etc/profile.d/rustc.sh << "EOF"
# Begin /etc/profile.d/rustc.sh

pathprepend /opt/rustc/bin           PATH

# Include /opt/rustc/man in the MANPATH variable to access manual pages
pathappend  /opt/rustc/share/man     MANPATH

# End /etc/profile.d/rustc.sh
EOF

source /etc/profile.d/rustc.sh


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
