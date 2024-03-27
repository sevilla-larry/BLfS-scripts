# b.24.00.Part7.21-28.sh
#
# Graphical Environments
#
#   24.21
#           skip 24.22 Xwayland
#   24.23
#   24.24.1.1
#   24.24.1.2
#   24.24.2.3
#
#   24.25
#   to
#   24.28
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "24.21.XKeyboardConfig-2.39"
echo "24.21.XKeyboardConfig-2.39" >> $LFSLOG_PROCESS

time { bash b.24.21.XKeyboardConfig-2.39.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
###     skipped 24.22 Xwayland
###

###
#       libepoxy is recommended but needed by Xorg-Server
###

echo "25.38.libepoxy-1.5.10"
echo "25.38.libepoxy-1.5.10" >> $LFSLOG_PROCESS

time { bash b.25.38.libepoxy-1.5.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.23.Xorg-Server-21.1.8"
echo "24.23.Xorg-Server-21.1.8" >> $LFSLOG_PROCESS

time { bash b.24.23.Xorg-Server-21.1.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.24.1.1.libevdev-1.13.1"
echo "24.24.1.1.libevdev-1.13.1" >> $LFSLOG_PROCESS

time { bash b.24.24.1.1.libevdev-1.13.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.24.1.2.Xorg.Evdev.Driver-2.10.6"
echo "24.24.1.2.Xorg.Evdev.Driver-2.10.6" >> $LFSLOG_PROCESS

time { bash b.24.24.1.2.Xorg.Evdev.Driver-2.10.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.25.twm-1.0.12"
echo "24.25.twm-1.0.12" >> $LFSLOG_PROCESS

time { bash b.24.25.twm-1.0.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.26.xterm-384"
echo "24.26.xterm-384" >> $LFSLOG_PROCESS

time { bash b.24.26.xterm-384.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.27.xclock-1.1.1"
echo "24.27.xclock-1.1.1" >> $LFSLOG_PROCESS

time { bash b.24.27.xclock-1.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.28.xinit-1.4.2"
echo "24.28.xinit-1.4.2" >> $LFSLOG_PROCESS

time { bash b.24.28.xinit-1.4.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.31.04.dejavu-fonts-ttf-2.37"
echo "24.31.04.dejavu-fonts-ttf-2.37" >> $LFSLOG_PROCESS

time { bash b.24.31.04.dejavu-fonts-ttf-2.37.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
