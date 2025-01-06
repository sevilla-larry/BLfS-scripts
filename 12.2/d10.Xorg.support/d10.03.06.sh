# d10.03.06.sh
#
# Graphics and Font Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.10.22.libpng-1.6.43"
echo "d10.10.22.libpng-1.6.43" >> $LFSLOG_PROCESS

time { bash d10.10.22.libpng-1.6.43.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.04.FreeType-2.13.3 - Pass 1 - before HarfBuzz"
echo "d10.10.04.FreeType-2.13.3 - Pass 1 - before HarfBuzz" >> $LFSLOG_PROCESS

time { bash d10.10.04.FreeType-2.13.3.Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.12.harfBuzz-9.0.0"
echo "d10.10.12.harfBuzz-9.0.0" >> $LFSLOG_PROCESS

time { bash d10.10.12.harfBuzz-9.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.04.FreeType-2.13.3 - Pass 2 - after HarfBuzz"
echo "d10.10.04.FreeType-2.13.3 - Pass 2 - after HarfBuzz" >> $LFSLOG_PROCESS

time { bash d10.10.04.FreeType-2.13.3.Pass2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.05.Fontconfig-2.15.0"
echo "d10.10.05.Fontconfig-2.15.0" >> $LFSLOG_PROCESS

time { bash d10.10.05.Fontconfig-2.15.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.32.Pixman-0.43.4"
echo "d10.10.32.Pixman-0.43.4" >> $LFSLOG_PROCESS

time { bash d10.10.32.Pixman-0.43.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
