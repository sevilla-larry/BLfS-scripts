# e33.03.8.2.support.apps.sh
#
# LXQt Support Applications - Part 2
#

# common apps to all Desktop Environments
# excludes RustC
bash e10.03.2.sh
bash e10.03.3.sh
#if	 [ "$WITH_SOUND" -eq 1 ]; then
#fi

# common apps to LXQt & KDE
bash e12.03.sh

# common apps to Gnome & LXQt
bash e13.03.sh

# LXQt support apps - Part 1
bash e31.03.1.sh
