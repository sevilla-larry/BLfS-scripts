# b.24.00.Part5.19.sh
#
# Graphical Environments
#
#   24.19 only
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "24.19.xcursor-themes-1.0.7"
echo "24.19.xcursor-themes-1.0.7" >> $LFSLOG_PROCESS

time { bash b.24.19.xcursor-themes-1.0.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
