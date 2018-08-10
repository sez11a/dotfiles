#!/bin/sh

if [ -t 2 ]; then
  # Standard error is a terminal
  emacs -nw "$@"
elif [ -n "$DISPLAY" ]; then
  # An X display is available
  xterm -e emacs -nw "$@"
else
  # We have nothing
  emacs --daemon "$@"
fi
