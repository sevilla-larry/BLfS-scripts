# BLfS-scripts
# Continuation of LfS-Scripts
#
# Author: Sevilla, Larry
#  eMail: sevilla.larry.prg@gmail.com
#
#
# based on: https://www.linuxfromscratch.org/blfs/
#
# BLfS version: 12.2
# Started: 2024/Sept/04
# arch: x64, UEFI (same with LfS-Scripts)
# Status: current
# 
# a: LfS			- working
# 
# c11: MariaDB		- working
# c12: PostgreSQL	- working
# c13: Apache		- working
# c14: ProFTPD		- working
#
# d20: Xorg			- working
#
# e23: Xfce			- working
#
# f22: LightDM		- NOT working
#
#
#
#
#
# Groupings
#
# Group a - LfS
#
#
# Group b - Common apps & Libraries
#
#       b10 - Common to XOrg & servers
#       b11 - Common to XOrg & MariaDB
#       ...
#		b15 - Common to XOrg, MariaDB & Apache
#
#       b20 - Common to DEs & servers
#       ...
# 
#
# Group c - Servers
#
#       c00 - Common to servers
#
#       c01 - Common to MariaDB & PostgreSQL
#       ...
#
#       c11 - MariaDB
#       c12 - PostgreSQL
#       c13 - Apache
#       c14 - ProFTPD
#
#       c19 - QEmu/KVM
# 
#
# Group d - XOrg ( includes dbus, elogind, ... )
#
#		d10 - Xorg ( & Xwayland ) Support
#
#		d20	- Xorg ( & Xwayland )
#
#
# Group e - Desktop Environment
#
#       e00	- Common to DE's & DMs
#
#		e10 - Common to all DE's
#		e11 - Common to Xfce & Gnome
#
#		e21	- Xfce other Support
#		e23 - Xfce Desktop
#		e24 - Xfce Applications
#
#		e31	- LXQt other Support
#		e32 - KF5, Plasma, & Misc Dependecies
#		e33	- LXQt Desktop Components
#		e34 - LXQt Applications
#
#       e41	- Gnome other Support
#		e42	- Gnome Libraries
#		e43	- Gnome Desktop Components
#		e44 - Gnome Applications
#
#       e51	- KDE other Support
#		e52 - KDE Preliminaries
#		e53 - KDE Frameworks 6
#		e54	- KDE Frameworks 6 Applications
#		e55 - KDE Plasma
#
#		e61 - LXDE Support
#		e63 - LXDE Desktop	???	from 12.0	???
#		e64 - LXDE Applications
#
#
# Group f - Display Manager
#
#       f00	- Common to DM's
#
#		f11	- GDM Support
#		f12	- GDM
#
#		f21	- LightDM Support
#       f22	- LightDM
#
#       f3x	- SDDM
#
#       f4x	- LXDM			??? (from 11.3)	???





# BLfS version: 12.1
# Started: 2024/Mar/27
# arch: x64, UEFI (same with LfS-Scripts)
# Status: Stopped, NOT working, busy
#
# Stopped BLfS version: 12.0
# Started: 2023/Sept/08
# arch: x64, UEFI
# Stopped: 2024/Feb


# BLfS ver: 11.3
# Started: 2023/Apr/15
# arch: x64, UEFI
# Stopped: before 2023/Sept
#
# Group a - LfS / status: OK, working
# Group b - XOrg only / status: root ok, user ok
#
# Group c - Xfce only / status: failed on VM
# Group c - LXDE only / 2023/Aug/13 22:00 NOT fully tested due to time constraints
# abandoned due to new version 12.0 released 2023/Sept/01
