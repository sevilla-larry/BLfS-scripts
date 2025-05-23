# e23.03.8.all.support.apps.sh
#
# Xfce Support Applications
#

# common apps to all Desktop Environments
bash e10.03.1.sh
bash e10.03.2.sh

#if	 [ "$WITH_SOUND" -eq 1 ]; then
#fi

# common apps to Xfce & Gnome
bash e11.03.1.sh
bash e11.03.2.sh
bash e11.03.3.sh

#if	 [ "$WITH_SOUND" -eq 1 ]; then
    bash e11.03.4.sh
#fi

# Xfce support apps
 bash e21.03.sh
