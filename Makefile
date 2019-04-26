.PHONY: all clean

# Override using `make F=FontName'
F = font

# All the Roboto font styles/weights
STYLES = Regular Italic $(foreach f,Black Bold Light Medium Thin,$(f) $(f)Italic)
CSTYLES = Regular Italic $(foreach f,Bold Light,$(f) $(f)Italic)
# Font filenames
FONTS = $(foreach s,$(STYLES),system/fonts/Roboto-$(s).ttf)
CONDENSED = $(foreach s,$(CSTYLES),system/fonts/RobotoCondensed-$(s).ttf)

EXISTING = $(addprefix system/fonts/,$(notdir $(wildcard fonts/$(F)/*.ttf)))
FONTS_TOMAKE = $(filter-out $(EXISTING),$(FONTS) $(CONDENSED))

all: zips/$(F).zip

clean:
	$(RM) system/fonts/*.ttf
	$(RM) zips/$(F).zip

$(EXISTING): system/fonts/%.ttf: fonts/$(F)/%.ttf
	cp $< $@
	bin/colonize.py $@

$(FONTS_TOMAKE): system/fonts/RobotoCondensed-%.ttf: system/fonts/Roboto-%.ttf
	bin/condense.py $< $@

zips/$(F).zip: files.txt $(FONTS) $(CONDENSED)
	$(RM) $@
	sed -i -e "s/^id=.*/id=fontschanger-$(shell echo $(F) | tr A-Z a-z)/;s/^name=.*/name=$(F) Font/;s/^description=.*/description=$(F) Font/" module.prop
	zip -qr0 $@ . -i@files.txt -x system/fonts/README
