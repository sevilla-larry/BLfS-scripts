# d20.03.1.Part07.42.3.PC.sh
#
# Graphical Environments
#
#   for Haswell or earlier
#   using i7-4790
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.42.41.libva-2.22.0 - before Mesa"
echo "d20.42.41.libva-2.22.0 - before Mesa" >> $LFSLOG_PROCESS

export PKGPASS=1
time { bash d20.42.41.libva-2.22.0.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.42.42.libvdpau-1.5"
echo "d20.42.42.libvdpau-1.5" >> $LFSLOG_PROCESS

time { bash d20.42.42.libvdpau-1.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.13.24.16.ply-3.11"
echo "d20.13.24.16.ply-3.11" >> $LFSLOG_PROCESS

time { bash d20.13.24.16.ply-3.11.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.09.92.SPIRV-Headers-1.4.321.0"
echo "d20.09.92.SPIRV-Headers-1.4.321.0" >> $LFSLOG_PROCESS

time { bash d20.09.92.SPIRV-Headers-1.4.321.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.09.93.SPIRV-Tools-1.4.321.0"
echo "d20.09.93.SPIRV-Tools-1.4.321.0" >> $LFSLOG_PROCESS

time { bash d20.09.93.SPIRV-Tools-1.4.321.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.25.12.Glslang-15.4.0"
echo "d20.25.12.Glslang-15.4.0" >> $LFSLOG_PROCESS

time { bash d20.25.12.Glslang-15.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.25.41.Vulkan-Headers-1.4.321"
echo "d20.25.41.Vulkan-Headers-1.4.321" >> $LFSLOG_PROCESS

time { bash d20.25.41.Vulkan-Headers-1.4.321.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.25.42.Vulkan-Loader-1.4.321"
echo "d20.25.42.Vulkan-Loader-1.4.321" >> $LFSLOG_PROCESS

time { bash d20.25.42.Vulkan-Loader-1.4.321.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
