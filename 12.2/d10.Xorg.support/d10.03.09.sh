# d10.03.09.sh
#
# Glslang, SPIRV
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.09.90.SPIRV-Headers-1.3.290.0"
echo "d10.09.90.SPIRV-Headers-1.3.290.0" >> $LFSLOG_PROCESS

time { bash d10.09.90.SPIRV-Headers-1.3.290.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.09.91.SPIRV-Tools-1.3.290.0"
echo "d10.09.91.SPIRV-Tools-1.3.290.0" >> $LFSLOG_PROCESS

time { bash d10.09.91.SPIRV-Tools-1.3.290.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.25.12.Glslang-14.3.0"
echo "d10.25.12.Glslang-14.3.0" >> $LFSLOG_PROCESS

time { bash d10.25.12.Glslang-14.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
