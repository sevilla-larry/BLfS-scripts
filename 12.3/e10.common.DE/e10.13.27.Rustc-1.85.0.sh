# e10.13.27.Rustc-1.85.0.sh
#

#
# Dependencies Required:
#
#               a.08.9x.?1 CMake-3.31.5
#               a.08.93.04 cURL-8.12.1
#               a.08.91.40 make-ca-1.16
#
# Dependencies Recommended:
#
#               a.08.91.68 libssh2-1.11.1
#               d10.13.13  LLVM-19.1.7
#               a.08.91.18 SQLite-3.49.1
#
# Dependencies Optional:
#
#               a.08.93.05 Git-2.48.1
#

#
# Required by:
#
#               e11.10.24 librsvg-2.59.2
#               e10.13.01 cargo-c-0.10.11
#               e10.13.02 Cbindgen-0.28.0
#
# Optionally by:
#
#               e41.42.13 gstreamer-1.26.3          (errata)
#               e41.13.26 Ruby-3.4.2
#

export PKG="rustc-1.85.0-src"
export PKGLOG_DIR=$LFSLOG/13.27
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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


mkdir -pv /opt/rustc-1.85.0         \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -svfn rustc-1.85.0 /opt/rustc    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat << EOF > config.toml    2>> $PKGLOG_ERROR
# see config.toml.example for more possible options
# See the 8.4 book for an old example using shipped LLVM
# e.g. if not installing clang, or using a version before 13.0

# Tell x.py the editors have reviewed the content of this file
# and updated it to follow the major changes of the building system,
# so x.py will not warn us to do such a review.
change-id = 134650

[llvm]
# When using system llvm prefer shared libraries
link-shared = true

# Do not download pre-built LLVM, instead either use the system
# LLVM or build LLVM from the shipped source.
download-ci-llvm = false

# If building the shipped LLVM source, only enable the x86 target
# instead of all the targets supported by LLVM.
targets = "X86"

[build]
# omit docs to save time and space (default is to build them)
docs = false

# install extended tools: cargo, clippy, etc
extended = true

# Do not query new versions of dependencies online.
locked-deps = true

# Specify which extended tools (those from the default install).
tools = ["cargo", "clippy", "rustdoc", "rustfmt"]

[install]
prefix = "/opt/rustc-1.85.0"
docdir = "share/doc/rustc-1.85.0"

[rust]
channel = "stable"
description = "for BLFS 12.3"

# Enable the same optimizations as the official upstream build.
lto = "thin"
codegen-units = 1

[target.x86_64-unknown-linux-gnu]
llvm-config = "/usr/bin/llvm-config"

[target.i686-unknown-linux-gnu]
llvm-config = "/usr/bin/llvm-config"
EOF

sed '/MirOpt/d' -i src/bootstrap/src/core/builder/mod.rs    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Python3 Build ..."
echo "2. Python3 Build ..." >> $LFSLOG_PROCESS
echo "2. Python3 Build ..." >> $PKGLOG_ERROR
[ ! -e /usr/include/libssh2.h ] || export LIBSSH2_SYS_USE_PKG_CONFIG=1
[ ! -e /usr/include/sqlite3.h ] || export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
./x.py build > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Python3 Test ..."
echo "4. Python3 Test ..." >> $LFSLOG_PROCESS
echo "4. Python3 Test ..." >> $PKGLOG_ERROR
./x.py test --verbose --no-fail-fast | tee rustc-testlog    2>> $PKGLOG_ERROR
cat rustc-testlog   > $PKGLOG_CHECK

# Note 6 tests in the bootstrap are known to fail
# check for SIGSEGV or signal 11
# see https://www.linuxfromscratch.org/blfs/view/12.3/general/rust.html

grep '^test result:' rustc-testlog |
 awk '{sum1 += $4; sum2 += $6} END { print sum1 " passed; " sum2 " failed" }'   \
 >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Python3 Install ..."
echo "5. Python3 Install ..." >> $LFSLOG_PROCESS
echo "5. Python3 Install ..." >> $PKGLOG_ERROR
./x.py install rustc std                        \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
./x.py install --stage=1 cargo clippy rustfmt   \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -fv /opt/rustc-1.85.0/share/doc/rustc-1.85.0/*.old   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -vm644 README.md                                \
               /opt/rustc-1.85.0/share/doc/rustc-1.85.0 \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -vdm755 /usr/share/zsh/site-functions           \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -sfv /opt/rustc/share/zsh/site-functions/_cargo      \
        /usr/share/zsh/site-functions                   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mv -v   /etc/bash_completion.d/cargo                    \
        /usr/share/bash-completion/completions          \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

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
