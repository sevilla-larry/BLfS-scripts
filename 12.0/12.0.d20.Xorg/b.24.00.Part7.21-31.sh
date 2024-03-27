# b.24.00.Part7.21-28.sh
#
# Graphical Environments
#
#   24.21
#   to
#   24.23
#
#   24.24.1.1   evdev lib
#   skipped.2   Xorg evdev driver
#   24.24.1.3   libinput
#   24.24.1.4   libinput driver
#
#   24.25
#   to
#   24.28
#
#   24.31.04    dejavu fonts
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
#       libepoxy is recommended but needed by Xorg-Server
###

echo "25.39.libepoxy-1.5.10"
echo "25.39.libepoxy-1.5.10" >> $LFSLOG_PROCESS

time { bash b.25.39.libepoxy-1.5.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.22.Xwayland-23.2.3"
echo "24.22.Xwayland-23.2.3" >> $LFSLOG_PROCESS

time { bash b.24.22.Xwayland-23.2.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.23.Xorg-Server-21.1.10"
echo "24.23.Xorg-Server-21.1.10" >> $LFSLOG_PROCESS

time { bash b.24.23.Xorg-Server-21.1.10.sh ; }

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

# echo "24.24.1.2.Xorg.Evdev.Driver-2.10.6"
# echo "24.24.1.2.Xorg.Evdev.Driver-2.10.6" >> $LFSLOG_PROCESS

# time { bash b.24.24.1.2.Xorg.Evdev.Driver-2.10.6.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

###

echo "24.24.1.3.libinput-1.23.0"
echo "24.24.1.3.libinput-1.23.0" >> $LFSLOG_PROCESS

time { bash b.24.24.1.3.libinput-1.23.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "24.24.1.4.Xorg.Libinput.Driver-1.3.0"
echo "24.24.1.4.Xorg.Libinput.Driver-1.3.0" >> $LFSLOG_PROCESS

time { bash b.24.24.1.4.Xorg.Libinput.Driver-1.3.0.sh ; }

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

echo "24.31.04.DejaVu-fonts-ttf-2.37"
echo "24.31.04.DejaVu-fonts-ttf-2.37" >> $LFSLOG_PROCESS

time { bash b.24.31.04.dejavu-fonts-ttf-2.37.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

### failed on download

# echo "24.31.09.Noto-fonts-ttf-v20201206-phase3"
# echo "24.31.09.Noto-fonts-ttf-v20201206-phase3" >> $LFSLOG_PROCESS

# time { bash b.24.31.09.Noto-fonts-ttf-v20201206-phase3.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

#####

unset LFSLOG_PROCESS
