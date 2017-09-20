#!/bin/sh
for file in *.xpm; do convert $file -resize 200% $file; done
