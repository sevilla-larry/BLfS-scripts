# d20.24.Part01.02-07.sh
#
# Graphical Environments
#
#   d20.24.02
#   to
#   d20.24.07
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.02.util-macros-1.20.1"
echo "d20.24.02.util-macros-1.20.1" >> $LFSLOG_PROCESS

time { bash d20.24.02.util-macros-1.20.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.03.xorgproto-2024.1"
echo "d20.24.03.xorgproto-2024.1" >> $LFSLOG_PROCESS

time { bash d20.24.03.xorgproto-2024.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.04.libXau-1.0.11"
echo "d20.24.04.libXau-1.0.11" >> $LFSLOG_PROCESS

time { bash d20.24.04.libXau-1.0.11.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.05.libXdmcp-1.1.5"
echo "d20.24.05.libXdmcp-1.1.5" >> $LFSLOG_PROCESS

time { bash d20.24.05.libXdmcp-1.1.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.06.xcb-proto-1.17.0"
echo "d20.24.06.xcb-proto-1.17.0" >> $LFSLOG_PROCESS

time { bash d20.24.06.xcb-proto-1.17.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.07.libxcb-1.17.0"
echo "d20.24.07.libxcb-1.17.0" >> $LFSLOG_PROCESS

time { bash d20.24.07.libxcb-1.17.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
