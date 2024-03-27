# b.24.00.Part4.18.sh
#
# Graphical Environments
#
#   24.18   Xorg Applications
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "24.18.Xorg.Applications"
echo "24.18.Xorg.Applications" >> $LFSLOG_PROCESS

time { bash b.24.18.Xorg.Applications.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
