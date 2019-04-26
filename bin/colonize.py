#!/usr/bin/env python3

import fontforge
import sys

f = fontforge.open(sys.argv[1])

if not any(g for g in f.glyphs() if g.unicode == 0xee01):
    f.selection.select(0x3a)
    f.copyReference()

    f.selection.select(0xee01)
    f.paste()

    f.generate(sys.argv[1])
