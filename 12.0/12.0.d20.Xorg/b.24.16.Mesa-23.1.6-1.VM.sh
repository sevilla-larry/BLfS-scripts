# b.24.16.Mesa-23.1.6-1.VM.sh
#
# Dependencies Required:
#
#               24.08 Xorg Libraries
#               25.37 Libdrm-2.4.115
#               13.24.13 Python Modules - Mako-1.2.4
#
#               for VirtIO use virgl
#               change gallium drivers to auto for PCs
#
# Dependencies Recommended:
#
#               xx.xx libva-2.19.0 for PCs
#               09.89 Wayland-Protocols-1.32
#
#
# Required by:
#
#               24.18 Xorg Applications
#               25.38 libepoxy-1.5.10
#
# Recommended by:
#
#               24.22 Xwayland-23.2.0
#
#
# Device Drivers --->
#   Graphics support --->
#     <*/M>   Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) --->
#                                                                       ...  [DRM]
#     # For r300 or r600:
#     < /*/M> ATI Radeon                                              [DRM_RADEON]
#     # For radeonsi:
#     < /*/M> AMD GPU                                                 [DRM_AMDGPU]
#     [*]       Enable amdgpu support for SI parts                 [DRM_AMDGPU_SI]
#     [*]       Enable amdgpu support for CIK parts               [DRM_AMDGPU_CIK]
#       Display Engine Configuration --->
#       [*]   AMD DC - Enable new display engine                      [DRM_AMD_DC]
#     # For nouveau:
#     < /*/M> Nouveau (NVIDIA) cards                                 [DRM_NOUVEAU]
#     # For i915, crocus, or iris:
#     < /*/M> Intel 8xx/9xx/G3x/G4x/HD Graphics                         [DRM_I915]
#     # For swrast:
#     < /*/M> Virtual GEM provider                                      [DRM_VGEM]
#     # For svga:
#     < /*/M> DRM driver for VMware Virtual GPU                       [DRM_VMWGFX]
#
# read: https://linuxfromscratch.org/blfs/view/12.0/x/mesa.html
#

export PKG="mesa-23.1.6"
export PKGLOG_DIR=$LFSLOG/24.16
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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


patch -Np1 -i ../mesa-add_xdemos-2.patch

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup                     \
        --prefix=$XORG_PREFIX   \
        --buildtype=release     \
        -Dplatforms=x11,wayland \
        -Dgallium-drivers=virgl \
        -Dvulkan-drivers=""     \
        -Dvalgrind=disabled     \
        -Dlibunwind=disabled    \
        ..                      \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#        -Dgallium-drivers=auto  \ PCs
#        -Dgallium-drivers=virgl \ VMs

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Meson Configure Test ..."
echo "4. Meson Configure Test ..." >> $LFSLOG_PROCESS
echo "4. Meson Configure Test ..." >> $PKGLOG_ERROR
meson configure -Dbuild-tests=true              \
        >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "5. Ninja Test ..."
echo "5. Ninja Test ..." >> $LFSLOG_PROCESS
echo "5. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Ninja Install ..."
echo "6. Ninja Install ..." >> $LFSLOG_PROCESS
echo "6. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -dm755 /usr/share/doc/mesa-23.1.6
cp -rf ../docs/* /usr/share/doc/mesa-23.1.6


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
