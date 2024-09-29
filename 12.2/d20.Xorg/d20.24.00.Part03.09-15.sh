# d20.24.00.Part03.09-15.sh
#
# Graphical Environments
#
#   d20.24.09
#   to
#   d20.24.15
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.09.libxcvt-0.1.2"
echo "d20.24.09.libxcvt-0.1.2" >> $LFSLOG_PROCESS

time { bash d20.24.09.libxcvt-0.1.2.sh ; }

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

###

echo "d20.24.11.xcb-util-image-0.4.1"
echo "d20.24.11.xcb-util-image-0.4.1" >> $LFSLOG_PROCESS

time { bash d20.24.11.xcb-util-image-0.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.12.xcb-util-keysyms-0.4.1"
echo "d20.24.12.xcb-util-keysyms-0.4.1" >> $LFSLOG_PROCESS

time { bash d20.24.12.xcb-util-keysyms-0.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.13.xcb-util-renderutil-0.3.10"
echo "d20.24.13.xcb-util-renderutil-0.3.10" >> $LFSLOG_PROCESS

time { bash d20.24.13.xcb-util-renderutil-0.3.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.14.xcb-util-wm-0.4.2"
echo "d20.24.14.xcb-util-wm-0.4.2" >> $LFSLOG_PROCESS

time { bash d20.24.14.xcb-util-wm-0.4.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.15.xcb-util-cursor-0.1.4"
echo "d20.24.15.xcb-util-cursor-0.1.4" >> $LFSLOG_PROCESS

time { bash d20.24.15.xcb-util-cursor-0.1.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
