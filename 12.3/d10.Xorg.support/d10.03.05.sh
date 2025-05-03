# d10.03.05.sh
#
# Graphics and Font Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.10.22.libpng-1.6.46"
echo "d10.10.22.libpng-1.6.46" >> $LFSLOG_PROCESS

time { bash d10.10.22.libpng-1.6.46.sh ; }

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

echo "d10.10.12.harfBuzz-10.4.0"
echo "d10.10.12.harfBuzz-10.4.0" >> $LFSLOG_PROCESS

time { bash d10.10.12.harfBuzz-10.4.0.sh ; }

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

echo "d10.10.05.Fontconfig-2.16.0"
echo "d10.10.05.Fontconfig-2.16.0" >> $LFSLOG_PROCESS

time { bash d10.10.05.Fontconfig-2.16.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.32.Pixman-0.44.2"
echo "d10.10.32.Pixman-0.44.2" >> $LFSLOG_PROCESS

time { bash d10.10.32.Pixman-0.44.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
