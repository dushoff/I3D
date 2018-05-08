## Hooks

-include target.mk

###################################################################

Sources += Makefile README.md

######################################################################

ms = makestuff
-include local.mk

Sources += $(ms)
Makefile: $(ms)
$(ms):
	git submodule add -b master https://github.com/dushoff/$@.git

$(ms)/%.mk: $(ms)/Makefile ;

$(ms)/Makefile:
	git submodule init $(ms) 
	git submodule update $(ms) 
	touch $@

# -include $(ms)/perl.def
# -include $(ms)/newtalk.def
# -include $(ms)/repos.def

######################################################################

## Content

######################################################################

-include $(ms)/os.mk
-include $(ms)/visual.mk
-include $(ms)/git.mk

# -include $(ms)/texdeps.mk
# -include $(ms)/wrapR.mk

