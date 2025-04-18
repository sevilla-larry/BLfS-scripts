# d10.03.07.sh
#
# Glslang, SPIRV
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.09.90.SPIRV-Headers-1.4.304.1"
echo "d10.09.90.SPIRV-Headers-1.4.304.1" >> $LFSLOG_PROCESS

time { bash d10.09.90.SPIRV-Headers-1.4.304.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.09.91.SPIRV-Tools-1.4.304.1"
echo "d10.09.91.SPIRV-Tools-1.4.304.1" >> $LFSLOG_PROCESS

time { bash d10.09.91.SPIRV-Tools-1.4.304.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.25.12.Glslang-15.1.0"
echo "d10.25.12.Glslang-15.1.0" >> $LFSLOG_PROCESS

time { bash d10.25.12.Glslang-14.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
