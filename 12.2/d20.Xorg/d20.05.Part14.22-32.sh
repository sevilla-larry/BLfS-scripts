# d20.05.Part12.22-32.sh
#
# Graphical Environments
#
#   24.22
#   to
#   24.24
#
#   24.25.1.1   evdev lib
#   24.25.1.2   Xorg evdev driver
#   24.25.1.3   libinput
#   24.25.1.4   libinput driver
#
#   24.26
#   to
#   24.29
#
#   24.32.04    dejavu fonts
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.22.XKeyboardConfig-2.42"
echo "d20.24.22.XKeyboardConfig-2.42" >> $LFSLOG_PROCESS

time { bash d20.24.22.XKeyboardConfig-2.42.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.23.Xwayland-24.1.2"
echo "d20.24.23.Xwayland-24.1.2" >> $LFSLOG_PROCESS

time { bash d20.24.23.Xwayland-24.1.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.24.Xorg-Server-21.1.13"
echo "d20.24.24.Xorg-Server-21.1.13" >> $LFSLOG_PROCESS

time { bash d20.24.24.Xorg-Server-21.1.13.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.25.1.1.libevdev-1.13.2"
echo "d20.24.25.1.1.libevdev-1.13.2" >> $LFSLOG_PROCESS

time { bash d20.24.25.1.1.libevdev-1.13.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.25.1.2.Xorg.Evdev.Driver-2.10.6"
echo "d20.24.25.1.2.Xorg.Evdev.Driver-2.10.6" >> $LFSLOG_PROCESS

time { bash d20.24.25.1.2.Xorg.Evdev.Driver-2.10.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.25.1.3.libinput-1.26.1"
echo "d20.24.25.1.3.libinput-1.26.1" >> $LFSLOG_PROCESS

time { bash d20.24.25.1.3.libinput-1.26.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.25.1.4.Xorg.Libinput.Driver-1.4.0"
echo "d20.24.25.1.4.Xorg.Libinput.Driver-1.4.0" >> $LFSLOG_PROCESS

time { bash d20.24.25.1.4.Xorg.Libinput.Driver-1.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.26.twm-1.0.12"
echo "d20.24.26.twm-1.0.12" >> $LFSLOG_PROCESS

time { bash d20.24.26.twm-1.0.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.27.xterm-393"
echo "d20.24.27.xterm-393" >> $LFSLOG_PROCESS

time { bash d20.24.27.xterm-393.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.28.xclock-1.1.1"
echo "d20.24.28.xclock-1.1.1" >> $LFSLOG_PROCESS

time { bash d20.24.28.xclock-1.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.29.xinit-1.4.2"
echo "d20.24.29.xinit-1.4.2" >> $LFSLOG_PROCESS

time { bash d20.24.29.xinit-1.4.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.32.04.DejaVu-fonts-ttf-2.37"
echo "d20.24.32.04.DejaVu-fonts-ttf-2.37" >> $LFSLOG_PROCESS

time { bash d20.24.32.04.DejaVu-fonts-ttf-2.37.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

### failed on download

# echo "d20.24.32.09.Noto-fonts-ttf-v20201206-phase3"
# echo "d20.24.32.09.Noto-fonts-ttf-v20201206-phase3" >> $LFSLOG_PROCESS

# time { bash d20.24.32.09.Noto-fonts-ttf-v20201206-phase3.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

#####

unset LFSLOG_PROCESS
