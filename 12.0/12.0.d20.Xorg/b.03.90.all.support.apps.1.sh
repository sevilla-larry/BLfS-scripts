# b.03.90.all.support.apps.1.sh
#
# Support Applications
#

# libtirpc
bash b.17.00.Part1.sh

# Linux PAM & re-Install Shadow
bash b.04.00.Part1.sh

# dbus
bash b.12.00.Part1.sh

# "make install-dbus" from blfs-bootscripts
# then reboot
