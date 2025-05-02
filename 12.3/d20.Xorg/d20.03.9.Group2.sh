# d20.03.9.Group2.sh
#
# Graphical Environments
#
# Part 04:	09 & 10
# Part 05:          XCB Utilities
# Part 06:	25.33
# Part 07:	42.41	for PC
# Part 08:	12.Mesa
# Part 09:	42.xx	for PC
# Part 10:	13
# Part 11:	14	Xorg Applications
# Part 12:	15 ---> 16
# Part 13:	17	Xorg Fonts
# Part 14:	25.34
# Part 16:	18 ---> 28
#

bash d20.03.1.Part04.09-10.sh
bash d20.03.1.Part05.sh
bash d20.03.1.Part06.25.33.sh

if	[ "$COMPUTER_TYPE" -eq "PC" ]; then
	bash d20.03.1.Part07.42.3.PC.sh
fi

bash d20.03.1.Part08.12.sh

if	[ "$COMPUTER_TYPE" -eq "PC" ]; then
	bash d20.03.1.Part09.42.3.PC.sh
fi

bash d20.03.1.Part10.13.sh
bash d20.03.1.Part11.14.sh
bash d20.03.1.Part12.15-16.sh
bash d20.03.1.Part13.17.sh
bash d20.03.1.Part14.25.34.sh
bash d20.03.1.Part15.09.71.sh
bash d20.03.1.Part16.18-28.sh
