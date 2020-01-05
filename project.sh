#
#Check if root and help option
#
if [ $USER != "root" ]
then
    read -n 1 -s -r -p "Incorrect user. Must be run by Root. Press any key to exit.";echo
    exit
elif [ "$1" == -h ]
then
    echo "This program provides system utilities to Linux System Administrator."
    read -n 1 -s -r -p "Press any key to exit.";echo
    exit
elif [ ! -z $1 ]
then
    read -n 1 -s -r -p "Invalid input. Press any key to exit.";echo
    exit
else
    :
fi

#
#Trapping
#
trap "" 2 15 19

#
#function continue
#
function continue() {
    read -n 1 -s -r -p "Press any key to continue...";echo
    }

#
#Operating system
#
function operating_system() {
    clear
    echo ----------------------------
    echo "     System Information    "
    echo ----------------------------

    uname -a
    continue
    } 

#
#Hostname and DNS
#
function host_and_dns() {
    clear
    echo ----------------------------
    echo "     Hostname and DNS      "
    echo ----------------------------

    hostname
    continue
    }	

#
#network
#
function network() {
    clear
    echo ----------------------------
    echo "          Network          "
    echo ----------------------------

    netstat
    continue	
    }

#
#Users online
#
function users_online() {
    clear
    echo ----------------------------
    echo "        Users Online       "
    echo ----------------------------

    who
    continue
    }

#
#Users last logged in
#
function users_logged() {
    clear
    echo ----------------------------
    echo "   Users Last Logged in    "
    echo ----------------------------

    last
    continue
    }

#
#Memory
#
    function memory() {
    clear
    echo ----------------------------
    echo "          Memory           "
    echo ----------------------------

    vmstat
    continue
    }

#
#Disk
#
    function disk() {
    clear
    echo ----------------------------
    echo "           Disk            "
    echo ----------------------------

    fdisk -l
    continue
    }

#
#Processes
#
    function processes() {
    clear
    echo ----------------------------
    echo "         Processes         "
    echo ----------------------------

    ps
    continue
    }

#
#Firewall Status
#
    function firewall() {
    clear
    echo ----------------------------
    echo "      Firewall Status      "
    echo ----------------------------

    firewall-cmd --state
    continue
    }

#
#CPU
#
    function CPU() {
    clear
    echo ----------------------------
    echo "            CPU            "
    echo ----------------------------
    
    lscpu
    continue
    }

#
#Main Menu
#
    function menu() {
    clear
    echo ----------------------------
    echo "         Main Menu         "
    echo ----------------------------
    echo "1.  Operating system"
    echo "2.  Hostname and DNS"
    echo "3.  Network information"
    echo "4.  Users online"
    echo "5.  Users last logged in"
    echo "6.  Memory information"
    echo "7.  Disk information"
    echo "8.  Processes"
    echo "9.  Firewall status"
    echo "10. CPU information"
    echo "11. Exit"
    echo -n "Enter choice [1-11]: "
    }
#
#Wrong Choice
#
function error() {
    read -n 1 -s -r -p "Invalid input, press any key to main menu.";echo
    menu
    }
#
#choice
#
function choice() {
    read choice
    case $choice in
	1) operating_system;;
	2) host_and_dns;;
	3) network;;
	4) users_online;;
	5) users_logged;;
	6) memory;;
	7) disk;;
	8) processes;;
	9) firewall;;
	10) CPU;;
	11) exit;;
	*) error;;
    esac
    }
#
#Main loop
#
while true
do
    clear
    menu
    choice
done

