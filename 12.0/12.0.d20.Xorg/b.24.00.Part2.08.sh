# b.24.00.Part2.08.sh
#
# Graphical Environments
#
#   24.08   Xorg Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "24.08.Xorg.Libraries"
echo "24.08.Xorg.Libraries" >> $LFSLOG_PROCESS

time { bash b.24.08.Xorg.Libraries.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
