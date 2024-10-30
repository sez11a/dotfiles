#!/bin/sh

if [ "$LaTeX" = true ] ;then

  sudo dnf -qy install texlive biber

else 
  echo "Not installing LaTeX." 
fi
