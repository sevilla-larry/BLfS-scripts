# d20.05.Part09.19-20.sh
#
# Graphical Environments
#
#   d20.24.19
#   to
#   d20.24.20
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.19.luit-20240102"
echo "d20.24.19.luit-20240102" >> $LFSLOG_PROCESS

time { bash d20.24.19.luit-20240102.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.20.xcursor-themes-1.0.7"
echo "d20.24.20.xcursor-themes-1.0.7" >> $LFSLOG_PROCESS

time { bash d20.24.20.xcursor-themes-1.0.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
