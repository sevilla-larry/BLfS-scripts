# d20.03.1.Part14.22-32.sh
#
# Graphical Environments
#
#   24.18
#   to
#   24.20
#
#   24.21.1   evdev lib
#   24.21.2   Xorg evdev driver
#   24.21.3   libinput
#   24.21.4   libinput driver
#
#   24.22
#   to
#   24.25
#
#   24.28.04    dejavu fonts
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.18.XKeyboardConfig-2.44"
echo "d20.24.18.XKeyboardConfig-2.44" >> $LFSLOG_PROCESS

time { bash d20.24.18.XKeyboardConfig-2.44.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.19.Xwayland-24.1.6"
echo "d20.24.19.Xwayland-24.1.6" >> $LFSLOG_PROCESS

time { bash d20.24.19.Xwayland-24.1.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.20.Xorg-Server-21.1.16"
echo "d20.24.20.Xorg-Server-21.1.16" >> $LFSLOG_PROCESS

time { bash d20.24.20.Xorg-Server-21.1.16.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.21.1.libevdev-1.13.3"
echo "d20.24.21.1.libevdev-1.13.3" >> $LFSLOG_PROCESS

time { bash d20.24.21.1.libevdev-1.13.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.21.2.Xorg.Evdev.Driver-2.11.0"
echo "d20.24.21.2.Xorg.Evdev.Driver-2.11.0" >> $LFSLOG_PROCESS

time { bash d20.24.21.2.Xorg.Evdev.Driver-2.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.21.3.libinput-1.27.1"
echo "d20.24.21.3.libinput-1.27.1" >> $LFSLOG_PROCESS

time { bash d20.24.21.3.libinput-1.27.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.21.4.Xorg.Libinput.Driver-1.5.0"
echo "d20.24.21.4.Xorg.Libinput.Driver-1.5.0" >> $LFSLOG_PROCESS

time { bash d20.24.21.4.Xorg.Libinput.Driver-1.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.22.twm-1.0.12"
echo "d20.24.22.twm-1.0.12" >> $LFSLOG_PROCESS

time { bash d20.24.22.twm-1.0.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.23.xterm-397"
echo "d20.24.23.xterm-397" >> $LFSLOG_PROCESS

time { bash d20.24.23.xterm-397.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.24.xclock-1.1.1"
echo "d20.24.24.xclock-1.1.1" >> $LFSLOG_PROCESS

time { bash d20.24.24.xclock-1.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.25.xinit-1.4.3"
echo "d20.24.25.xinit-1.4.3" >> $LFSLOG_PROCESS

time { bash d20.24.25.xinit-1.4.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d20.24.28.04.DejaVu-fonts-ttf-2.37"
echo "d20.24.28.04.DejaVu-fonts-ttf-2.37" >> $LFSLOG_PROCESS

time { bash d20.24.28.04.DejaVu-fonts-ttf-2.37.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

### failed on download

# echo "d20.24.28.09.Noto-fonts-ttf-v20201206-phase3"
# echo "d20.24.28.09.Noto-fonts-ttf-v20201206-phase3" >> $LFSLOG_PROCESS

# time { bash d20.24.28.09.Noto-fonts-ttf-v20201206-phase3.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

#####

unset LFSLOG_PROCESS
