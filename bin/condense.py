#!/usr/bin/env python3

import sys
import fontforge

font = fontforge.open(sys.argv[1])

# Rename font
font.fontname = font.fontname.replace("-", "Condensed-")
font.familyname += " Condensed"
font.fullname += " Condensed"

# Condense
font.selection.all()
font.condenseExtend(0.85, 0)
font.round()

# Save
font.generate(sys.argv[2])
