#!/usr/local/bin/fontforge
#! (C) Thomas Maier, 2007
# Usage:
#   for i in *.otf; do echo $i; fontforge -script ~/bin/otf2ttf.sh $i; done
# Quick and dirty hack: converts a font to truetype (.ttf)
Print("Opening "+$1);
Open($1);
Print("Saving "+$1:r+".ttf");
Generate($1:r+".ttf");
Quit(0);
