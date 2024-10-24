# f22.04.all.sh
#
# LightDM
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "f22.26.02.lightdm-1.32.0"
echo "f22.26.02.lightdm-1.32.0" >> $LFSLOG_PROCESS

time { bash f22.26.02.lightdm-1.32.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
