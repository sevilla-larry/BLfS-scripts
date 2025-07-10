# e33.37.40.LXQt.Desktop.Final.Instructions.sh
#

#
# Dependencies Required:
#
#   openbox
#   kwin
#
# Recommended
#
#   breeze-icons
#   desktop-file-utils
#
# Optional:
#
#   sddm
#   XScreenSaver
#

export PKGLOG_DIR=$LFSLOG/37.40
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Final Configuration ..." >> $LFSLOG_PROCESS

ldconfig
update-mime-database /usr/share/mime
xdg-icon-resource forceupdate
update-desktop-database


unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_ERROR
unset PKGLOG_DIR
