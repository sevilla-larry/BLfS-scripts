# e10.03.3.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

###### Xfce Gnome KDE

if [ "$DE" -eq 2 ] || [ "$DE" -eq 4 ] || [ "$DE" -eq 5 ]; then

	###

	echo "e10.09.06.Aspell-0.60.8.1"
	echo "e10.09.06.Aspell-0.60.8.1" >> $LFSLOG_PROCESS

	time { bash e10.09.06.Aspell-0.60.8.1.sh ; }

	date +"%Y/%b/%d %H:%M"
	date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

	echo "." >> $LFSLOG_PROCESS
	echo "."
	echo "."

	###

	echo "e10.09.33.libassuan-3.0.2"
	echo "e10.09.33.libassuan-3.0.2" >> $LFSLOG_PROCESS

	time { bash e10.09.33.libassuan-3.0.2.sh ; }

	date +"%Y/%b/%d %H:%M"
	date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

	echo "." >> $LFSLOG_PROCESS
	echo "."
	echo "."

	###

	echo "e10.04.08.GPGME-1.24.2"
	echo "e10.04.08.GPGME-1.24.2" >> $LFSLOG_PROCESS

	time { bash e10.04.08.GPGME-1.24.2.sh ; }

	date +"%Y/%b/%d %H:%M"
	date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

	echo "." >> $LFSLOG_PROCESS
	echo "."
	echo "."

	###

	echo "e10.42.53.sound-theme-freedesktop-0.8"
	echo "e10.42.53.sound-theme-freedesktop-0.8" >> $LFSLOG_PROCESS

	time { bash e10.42.53.sound-theme-freedesktop-0.8.sh ; }

	date +"%Y/%b/%d %H:%M"
	date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

	echo "." >> $LFSLOG_PROCESS
	echo "."
	echo "."

	###

fi

###### Gnome KDE

if [ "$DE" -eq 4 ] || [ "$DE" -eq 5 ]; then

	###

	echo "e10.09.40.libdaemon-0.14"
	echo "e10.09.40.libdaemon-0.14" >> $LFSLOG_PROCESS

	time { bash e10.09.40.libdaemon-0.14.sh ; }

	date +"%Y/%b/%d %H:%M"
	date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

	echo "." >> $LFSLOG_PROCESS
	echo "."
	echo "."

	###

fi

######

unset LFSLOG_PROCESS
