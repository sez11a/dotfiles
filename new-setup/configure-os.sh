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

_isarch=true
_ismanjaro=false
_isfedora=false

scriptsDir="arch"

[[ -f /etc/manjaro-release ]] && _ismanjaro=true
if [ -f /etc/fedora-release ] 
  then 
    _isfedora=true
    _isarch=false
    scriptsDir="fedora"
fi

# Set up preliminary CLI/utilities
source $scriptsDir/1-preliminary.sh

# Preliminaries are now out of the way; time for questions
source $scriptsDir/2-questions.sh

# Configure OS 
source $scriptsDir/3-os.sh 

# Configure KDE Plasma
source $scriptsDir/4-kdeplasma.sh

# Configure Apps and Fonts
source $scriptsDir/5-apps-fonts.sh

# Configure 3D Printing Apps
source $scriptsDir/6-3d-printing.sh

# Configure Developer Tools
source $scriptsDir/7-dev-tools.sh; 

# Configure LaTeX
source $scriptsDir/8-latex.sh; 

# Configure Emulators
source $scriptsDir/9-emulators.sh;

if [ "$plasma" = false ] ;then
  echo "If you want to configure Plasma later, run 4-kdeplasma.sh from the appropriate scripts folder."
  say "If you want to configure Plasma later, run 4-kdeplasma.sh from the appropriate scripts folder."
fi

echo "All done! Please reboot your system now."
say "All done! Please reboot your system now."

exit 0;
