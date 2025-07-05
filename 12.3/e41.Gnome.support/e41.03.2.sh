# e41.03.3.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "e41.11.06.glslc.from.shaderc-2024.4"
echo "e41.11.06.glslc.from.shaderc-2024.4" >> $LFSLOG_PROCESS

time { bash e41.11.06.glslc.from.shaderc-2024.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
