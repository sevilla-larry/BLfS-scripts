# b.24.00.Part1.02-07.sh
#
# Graphical Environments
#
#   24.02
#   to
#   24.07
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

#
# NOTE: This should be executed only ONCE

# echo "24.01.Xorg.Build.Environment"
# echo "24.01.Xorg.Build.Environment" >> $LFSLOG_PROCESS

# time { bash b.24.01.Xorg.Build.Environment.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

###

echo "24.02.util-macros-1.20.0"
echo "24.02.util-macros-1.20.0" >> $LFSLOG_PROCESS

time { bash b.24.02.util-macros-1.20.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.03.xorgproto-2023.2"
echo "24.03.xorgproto-2023.2" >> $LFSLOG_PROCESS

time { bash b.24.03.xorgproto-2023.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.04.libXau-1.0.11"
echo "24.04.libXau-1.0.11" >> $LFSLOG_PROCESS

time { bash b.24.04.libXau-1.0.11.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# NOTE: Recommended, but NEEDED by XOrg-Server

echo "24.05.libXdmcp-1.1.4"
echo "24.05.libXdmcp-1.1.4" >> $LFSLOG_PROCESS

time { bash b.24.05.libXdmcp-1.1.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.06.xcb-proto-1.16.0"
echo "24.06.xcb-proto-1.16.0" >> $LFSLOG_PROCESS

time { bash b.24.06.xcb-proto-1.16.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.07.libxcb-1.16"
echo "24.07.libxcb-1.16" >> $LFSLOG_PROCESS

time { bash b.24.07.libxcb-1.16.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
