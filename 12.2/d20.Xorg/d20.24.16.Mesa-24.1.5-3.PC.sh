# d20.24.16.Mesa-24.1.5-3.PC.sh
#

#
#   gallium drivers:
#
#       VirtIO      - swrast
#       Virtualbox  - svga, swrast
#       PCs         - crocus		Intel i7-4790
#
#
#   vulkan drivers:
#
#       VirtIO      - swrast
#       Virtualbox  - swrast
#       PCs         - intel_hasvk	Intel i7-4790
#

#
# Dependencies Required:
#
#               d20.24.08 Xorg Libraries
#               d20.25.34 Libdrm-2.4.122
#               d10.13.23.13 Python Modules - Mako-1.3.5
#
# Dependencies Recommended:
#
#               d10.09.98 Wayland-Protocols-1.36
#               d20.42.41 libva-2.22.0              for PCs
#               d20.42.42 libvdpau-1.5              for PCs
#               d10.13.12 LLVM-18.1.7
#

#
# Required by:
#
#               d20.24.18 Xorg Applications
#               d20.25.35 libepoxy-1.5.10
#               d20.42.43 libvdpau-va-gl-0.4.2      for PCs
#
# Recommended by:
#
#               d20.24.23 Xwayland-24.1.2
#               e12.25.42 Qt-6.7.2
#               g12.39.03 LibreOffice-24.8.0
#
# Recommended Runtime by:
#
#               d20.42.41 libva-2.22.0              for PCs
#               d20.42.42 libvdpau-1.5              for PCs
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
# read: https://linuxfromscratch.org/blfs/view/12.2/x/mesa.html
#

export PKG="mesa-24.1.5"
export PKGLOG_DIR=$LFSLOG/24.16
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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


patch -Np1 -i ../mesa-add_xdemos-2.patch    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
# Intel i7-1790
meson setup ..                  \
      --prefix=$XORG_PREFIX     \
      --buildtype=release       \
      -D platforms=x11,wayland  \
      -D gallium-drivers=crocus \
      -D vulkan-drivers=intel_hasvk \
      -D valgrind=disabled      \
      -D libunwind=disabled     \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Meson Configure Test ..."
echo "4. Meson Configure Test ..." >> $LFSLOG_PROCESS
echo "4. Meson Configure Test ..." >> $PKGLOG_ERROR
meson   configure           \
        -D build-tests=true \
        >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "5. Ninja Test ..."
echo "5. Ninja Test ..." >> $LFSLOG_PROCESS
echo "5. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Ninja Install ..."
echo "6. Ninja Install ..." >> $LFSLOG_PROCESS
echo "6. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp -rv ../docs -T /usr/share/doc/mesa-24.1.5    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
