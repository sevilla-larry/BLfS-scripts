# b.24.00.Part6.20.sh
#
# Graphical Environments
#
#   24.20   Xorg Fonts
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "24.20.Xorg.Fonts"
echo "24.20.Xorg.Fonts" >> $LFSLOG_PROCESS

time { bash b.24.20.Xorg.Fonts.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
