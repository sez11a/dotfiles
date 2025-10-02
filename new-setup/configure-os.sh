#!/bin/bash

_rundir=$(pwd)

# Set some colors for output messages
OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
WARN="$(tput setaf 166)[WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
ORANGE=$(tput setaf 166)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

echo "${ORANGE} Detecting OS..."

_isarch=true
_ismanjaro=false
_isfedora=false
_isdebian=false
_isOM=false

scriptsDir="arch"
osName="Arch               "

[[ -f /etc/manjaro-release ]] && _ismanjaro=true
if grep -q "EndeavourOS" /etc/os-release; then
    _ismanjaro=true
	osName="EndeavourOS/Manjaro"
fi

if [ -f /etc/mandriva-release ] ; then
  _isOM=true
  _isarch=false
  scriptsDir="OM"
  osName="OpenMandriva       "
  sudo dnf -y install newt
fi

if [ -f /etc/fedora-release ] || grep -q "Fedora" /etc/os-release; then
    _isfedora=true
    _isarch=false
    scriptsDir="fedora"
	osName="Fedora            "
	sudo dnf -y install newt
fi

if grep -q "Debian" /etc/os-release; then
  _isdebian=true
  _isarch=false
  scriptsDir="debian"
  osName="Debian             "
fi

echo "${NOTE}╔══════════════════════════════╗"
echo "${NOTE}║ Detected ${osName} ║"
echo "${NOTE}╚══════════════════════════════╝"

whiptail --title "Welcome to Rich Sezov's Install Script" \
	--msgbox "Welcome to Rich Sezov's setup script!\n\n\
	This works with OpenMandriva Linux, Arch Linux, Fedora Linux,\n\n\
	and to a lesser extent (CLI only) Debian.\n\n\
	If you want to configure KDE Plasma, make sure it is installed first." \
		15 80

if ! whiptail --title "Proceed?" \
	--yesno "The next step sets up some preliminary utilities and performs an update.\n\n\
	When that completes, you're asked several questions about what you want to install.\n\n\
	Do you want to proceed?" 20 60; then
		echo -e "\n"
		echo "You chose NOT to proceed."
		echo -e "\n"
		exit 1
fi

# Set up preliminary CLI/utilities
source $scriptsDir/1-preliminary.sh

say "Does this machine have a HIDPI screen?"
if $DIALOG --yesno "HIDPI screen?" 20 60 ;then
    sudo cp conf/vconsole.conf /etc
else
    echo "Nope."
fi

plasma=false
say "Configure Plasma Desktop?"
if $DIALOG --yesno "Configure Standard Plasma Desktop? Default is yes; if installing a lightweight system, answer no." 20 60; then
  plasma=true; else echo "Nope."; fi

DesktopApps=false
say "Install standard desktop apps?"
if $DIALOG --yesno "Install standard desktop apps?" 20 60; then
  DesktopApps=true; else echo "Nope."; fi

ThreeDPrintingApps=false
say "Install 3D printing apps?"
if $DIALOG --yesno "Install 3D printing apps?" 20 60; then
  ThreeDPrintingApps=true; else echo "Nope."; fi

DevTools=false
say "Do you want to install developer tools?"
if $DIALOG --yesno "Install Dev Tools?" 20 60 ;then
    DevTools=true; else echo "Nope."; fi

LaTeX=false
say "Do you want to install LaTeX?"
if $DIALOG --yesno "Install LaTeX?" 20 60 ;then
    LaTeX=true; else echo "Nope."; fi

emulators=false
say "Do you want to install emulators for vintage computing?"
if $DIALOG --yesno "Install emulators for vintage computing?" 20 60 ;then
    emulators=true; else echo "Nope."; fi

# Configure OS
source $scriptsDir/3-os.sh

# Configure KDE Plasma
if $plasma ;then
  source $scriptsDir/4-kdeplasma.sh
else
  echo "If you want to configure Plasma later, run the appropriate 4-kdeplasma.sh from this folder."
  say "If you want to configure Plasma later, run the appropriate 4-kdeplasma.sh from this folder."
fi

# Configure Apps and Fonts
if $DesktopApps ;then
  source $scriptsDir/5-apps-fonts.sh
fi

# Configure 3D Printing Apps
if $ThreeDPrintingApps ;then
  echo "Installing 3D Printing apps...."
  source $scriptsDir/6-3d-printing.sh
fi

# Configure Developer Tools
if $DevTools ;then
  source $scriptsDir/7-dev-tools.sh
fi

# Configure LaTeX
if $LaTeX ;then
  source $scriptsDir/8-latex.sh
fi

# Configure Emulators
if $emulators ;then
  source $scriptsDir/9-emulators.sh
fi

echo "All done! Please reboot your system now."
say "All done! Please reboot your system now."

exit 0;