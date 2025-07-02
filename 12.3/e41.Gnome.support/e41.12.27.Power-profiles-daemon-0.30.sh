# e41.12.27.Power-profiles-daemon-0.30.sh
#

#
# Dependencies Required:
#
#               d10.04.20 Polkit-126
#               e41.13.24.23 PyGObject-3.50.0
#               e10.12.37 UPower-1.90.7
#

#
# Recommended by:
#
#               e43.33.42 gnome-shell-47.4
#

# Kernel Configuration
#
# Power management and ACPI options --->
#   CPU Frequency scaling --->
#     -*-   CPU Frequency scaling                                       [CPU_FREQ]
#     -*-     'performance' governor                    [CPU_FREQ_GOV_PERFORMANCE]
#     <*/M>   'powersave' governor                        [CPU_FREQ_GOV_POWERSAVE]
#     # Select if CPU is Intel:
#     [ /*]   Intel P state control                             [X86_INTEL_PSTATE]
#     # Select if CPU is AMD:
#     [ /*]   AMD Processor P-State driver                        [X86_AMD_PSTATE]
#
# Device Drivers --->
#   # Some drivers under this submenu provide "platform profile" support
#   # and power-profiles-daemon can take advantage from platform profiles;
#   # select a driver if suitable for your platform:
#   [ /*] X86 Platform Specific Device Drivers --->         [X86_PLATFORM_DEVICES]
#

export PKG="power-profiles-daemon-0.30"
export PKGLOG_DIR=$LFSLOG/12.27
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr                   \
            --buildtype=release             \
            -D gtk_doc=false                \
            -D tests=false                  \
            -D systemdsystemunitdir=/tmp    \
            ..                              \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -fv /tmp/power-profiles-daemon.service       \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -vdm755 /var/lib/power-profiles-daemon  \
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
