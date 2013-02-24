
SUBDIRS = host plugins bindings

.PHONY: subdirs $(SUBDIRS)

all clean subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

host: plugins

plugins: bindings

