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

# echo "d20.42.41.libva-2.22.0 - before Mesa"
# echo "d20.42.41.libva-2.22.0 - before Mesa" >> $LFSLOG_PROCESS
#
# export PKGPASS=1
# time { bash d20.42.41.libva-2.22.0.sh ; }
# unset PKGPASS
# 
# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

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

echo "d20.09.90.SPIRV-Headers-1.4.304.1"
echo "d20.09.90.SPIRV-Headers-1.4.304.1" >> $LFSLOG_PROCESS

time { bash d20.09.90.SPIRV-Headers-1.4.304.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.09.91.SPIRV-Tools-1.4.304.1"
echo "d20.09.91.SPIRV-Tools-1.4.304.1" >> $LFSLOG_PROCESS

time { bash d20.09.91.SPIRV-Tools-1.4.304.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.25.12.Glslang-15.1.0"
echo "d20.25.12.Glslang-15.1.0" >> $LFSLOG_PROCESS

time { bash d20.25.12.Glslang-15.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.25.43.Vulkan-Headers-1.4.304"
echo "d20.25.43.Vulkan-Headers-1.4.304" >> $LFSLOG_PROCESS

time { bash d20.25.43.Vulkan-Headers-1.4.304.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.25.44.Vulkan-Loader-1.4.304"
echo "d20.25.44.Vulkan-Loader-1.4.304" >> $LFSLOG_PROCESS

time { bash d20.25.44.Vulkan-Loader-1.4.304.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# echo "d20.42.42.libvdpau-1.5"
# echo "d20.42.42.libvdpau-1.5" >> $LFSLOG_PROCESS
#
# time { bash d20.42.42.libvdpau-1.5.sh ; }
#
# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS
#
# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

#####

unset LFSLOG_PROCESS
