# d10.03.05.sh
#
# Graphics and Font Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.10.22.libpng-1.6.50"
echo "d10.10.22.libpng-1.6.50" >> $LFSLOG_PROCESS

time { bash d10.10.22.libpng-1.6.50.sh ; }

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

echo "d10.10.11.Graphite2-1.3.14 - Pass 1 - before HarfBuzz"
echo "d10.10.11.Graphite2-1.3.14 - Pass 1 - before HarfBuzz" >> $LFSLOG_PROCESS

time { bash d10.10.11.Graphite2-1.3.14.Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.12.harfBuzz-11.4.1"
echo "d10.10.12.harfBuzz-11.4.1" >> $LFSLOG_PROCESS

time { bash d10.10.12.harfBuzz-11.4.1.sh ; }

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

echo "d10.10.11.Graphite2-1.3.14 - Pass 2 - after HarfBuzz"
echo "d10.10.11.Graphite2-1.3.14 - Pass 2 - after HarfBuzz" >> $LFSLOG_PROCESS

time { bash d10.10.11.Graphite2-1.3.14.Pass2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.05.Fontconfig-2.17.1"
echo "d10.10.05.Fontconfig-2.17.1" >> $LFSLOG_PROCESS

time { bash d10.10.05.Fontconfig-2.17.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.33.Pixman-0.46.4"
echo "d10.10.33.Pixman-0.46.4" >> $LFSLOG_PROCESS

time { bash d10.10.33.Pixman-0.46.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
