# e11.13.26.Rustc-1.85.0.sh
#

#
# Dependencies Required:
#
#               b11.13.03 CMake-3.30.2
#               b11.17.02 cURL-8.10.1
#
# Dependencies Recommended:
#
#               e11 09.63 libssh2-1.11.0
#               d10.13.12.LLVM-18.1.7
#               e10.22.05 SQLite-3.46.1
#
# Dependencies Optional:
#
#               d10.13.09 Git-2.46.0
#

#
# Required by:
#
#               g11.13.01 Cbindgen-0.27.0
#               e11.10.24 librsvg-2.58.3
#

export PKG="rustc-1.85.0-src"
export PKGLOG_DIR=$LFSLOG/13.26
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir -pv /opt/rustc-1.80.1         \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -svfn rustc-1.80.1 /opt/rustc    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat << EOF > config.toml    2>> $PKGLOG_ERROR
# see config.toml.example for more possible options
# See the 8.4 book for an old example using shipped LLVM
# e.g. if not installing clang, or using a version before 13.0

# Tell x.py the editors have reviewed the content of this file
# and updated it to follow the major changes of the building system,
# so x.py will not warn us to do such a review.
change-id = 125535

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
prefix = "/opt/rustc-1.80.1"
docdir = "share/doc/rustc-1.80.1"

[rust]
channel = "stable"
description = "for BLFS 12.2"

# Enable the same optimizations as the official upstream build.
lto = "thin"
codegen-units = 1

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
{ [ ! -e /usr/include/sqlite3.h ] ||
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1; }
python3 x.py build > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Python3 Check ..."
echo "4. Python3 Check ..." >> $LFSLOG_PROCESS
echo "4. Python3 Check ..." >> $PKGLOG_ERROR
SSL_CERT_DIR=/etc/ssl/certs \
python3 x.py test --verbose --no-fail-fast --keep-stage-std=1 | \
    tee rustc-testlog 2>> $PKGLOG_ERROR
    cat rustc-testlog   > $PKGLOG_CHECK

# Note 3 tests are known to fail
# check for SIGSEGV or signal 11
# see https://www.linuxfromscratch.org/blfs/view/12.2/general/rust.html

echo "5. Python3 Install ..."
echo "5. Python3 Install ..." >> $LFSLOG_PROCESS
echo "5. Python3 Install ..." >> $PKGLOG_ERROR
python3 x.py install rustc std                      \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm755                                      \
  build/host/stage1-tools/*/*/{cargo{,-clippy,-fmt},clippy-driver,rustfmt} \
  /opt/rustc-1.80.1/bin                             \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vDm644                                     \
  src/tools/cargo/src/etc/_cargo                    \
  /opt/rustc-1.80.1/share/zsh/site-functions/_cargo \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 src/tools/cargo/src/etc/man/*        \
  /opt/rustc-1.80.1/share/man/man1                  \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -fv /opt/rustc-1.80.1/share/doc/rustc-1.80.1/*.old   \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 README.md                                \
               /opt/rustc-1.80.1/share/doc/rustc-1.80.1 \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -vdm755 /usr/share/zsh/site-functions           \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
ln -sfv /opt/rustc/share/zsh/site-functions/_cargo      \
        /usr/share/zsh/site-functions                   \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

unset LIB{SSH2,SQLITE3}_SYS_USE_PKG_CONFIG

cat > /etc/profile.d/rustc.sh << "EOF"  2>> $PKGLOG_ERROR
# Begin /etc/profile.d/rustc.sh

pathprepend /opt/rustc/bin           PATH

# End /etc/profile.d/rustc.sh
EOF

source /etc/profile.d/rustc.sh


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
