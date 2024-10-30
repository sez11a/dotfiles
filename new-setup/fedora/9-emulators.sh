#!/bin/sh 

if [ "$emulators" = true ] ;then

  sudo dnf -qy install fs-uae fs-uae-launcher fs-uae-arcade atari800 BasiliskII vice 
  sudo dnf -qy copr enable rob72/DOSBox-X
  sudo dnf -qy install dosbox-x

else 
  echo "Not installing emulators."
fi
