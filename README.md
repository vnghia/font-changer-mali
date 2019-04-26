# Magisk Font Changer

To build a Magisk module that replaces the system font with one of your choosing:

1. Create the directory `fonts/YourFontName`.
2. Copy the various versions of the font to `fonts/YourFontName/Roboto-*.ttf`.
3. Run `make F=YourFontName`.

The module will be built as `zips/YourFontName.zip`, after making the following
modifications to the font:

* The "display colon" character U+EE01 is replaced with a reference to the
  ASCII colon U+003A, since most fonts don't provide U+EE01.
* FontForge will be used to attempt to build missing variants of the font.
  Italicizing does not currently yield good results, but condensed forms are
  built automatically.

Inspired by [zyu0090's Magisk FontsChanger](https://github.com/zyu0090/magisk-fontschanger).
