# d20.03.1.Part12.15-16.sh
#
# Graphical Environments
#
#   d20.24.15
#   &
#   d20.24.16
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.15.luit-20240910"
echo "d20.24.15.luit-20240910" >> $LFSLOG_PROCESS

time { bash d20.24.15.luit-20240910.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.16.xcursor-themes-1.0.7"
echo "d20.24.16.xcursor-themes-1.0.7" >> $LFSLOG_PROCESS

time { bash d20.24.16.xcursor-themes-1.0.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
