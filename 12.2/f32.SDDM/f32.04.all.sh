# f32.04.all.sh
#
# SDDM
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "f32.26.03.sddm-0.21.0"
echo "f32.26.03.sddm-0.21.0" >> $LFSLOG_PROCESS

time { bash f32.26.03.sddm-0.21.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
