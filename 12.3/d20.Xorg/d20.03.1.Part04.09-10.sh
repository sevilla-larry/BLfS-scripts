# d20.03.1.Part04.09-10.sh
#
# Graphical Environments
#
#   d20.24.09
#   &
#   d20.24.10
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.09.libxcvt-0.1.3"
echo "d20.24.09.libxcvt-0.1.3" >> $LFSLOG_PROCESS

time { bash d20.24.09.libxcvt-0.1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.10.xcb-util-0.4.1"
echo "d20.24.10.xcb-util-0.4.1" >> $LFSLOG_PROCESS

time { bash d20.24.10.xcb-util-0.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
