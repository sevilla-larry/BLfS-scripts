# e10.03.1.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e10.13.16.NASM-2.16.03"
echo "e10.13.16.NASM-2.16.03" >> $LFSLOG_PROCESS

time { bash e10.13.16.NASM-2.16.03.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.13.37.yasm-1.3.0"
echo "e10.13.37.yasm-1.3.0" >> $LFSLOG_PROCESS

time { bash e10.13.37.yasm-1.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.09.29.JSON-GLib-1.10.0"
echo "e10.09.29.JSON-GLib-1.10.0" >> $LFSLOG_PROCESS

time { bash e10.09.29.JSON-GLib-1.10.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.09.45.libgudev-238"
echo "e10.09.45.libgudev-238" >> $LFSLOG_PROCESS

time { bash e10.09.45.libgudev-238.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.09.69.libusb-1.0.27"
echo "e10.09.69.libusb-1.0.27" >> $LFSLOG_PROCESS

time { bash e10.09.69.libusb-1.0.27.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.09.71.libxkbcommon-1.7.0"
echo "e10.09.71.libxkbcommon-1.7.0" >> $LFSLOG_PROCESS

time { bash e10.09.71.libxkbcommon-1.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.06.FriBidi-1.0.15"
echo "e10.10.06.FriBidi-1.0.15" >> $LFSLOG_PROCESS

time { bash e10.10.06.FriBidi-1.0.15.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.16.libexif-0.6.24"
echo "e10.10.16.libexif-0.6.24" >> $LFSLOG_PROCESS

time { bash e10.10.16.libexif-0.6.24.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.10.18.libjpeg-turbo-3.0.1"
echo "e10.10.18.libjpeg-turbo-3.0.1" >> $LFSLOG_PROCESS

time { bash e10.10.18.libjpeg-turbo-3.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e10.28.07.hicolor-icon-theme-0.18"
echo "e10.28.07.hicolor-icon-theme-0.18" >> $LFSLOG_PROCESS

time { bash e10.28.07.hicolor-icon-theme-0.18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
