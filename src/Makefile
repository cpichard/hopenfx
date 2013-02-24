
SUBDIRS = host plugins bindings

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

host: plugins

plugins: bindings

