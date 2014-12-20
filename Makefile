CRATES = matches show zip-longest text_writer

.PHONY: default
default: test

define ALL

.PHONY: $(1)
$(1): $(addprefix $(1)-,$(CRATES))
$(foreach crate,$(CRATES),$(eval $(call ONE,$(1),$(crate))))

endef

define ONE

.PHONY: $(1)-$(2)
$(1)-$(2):
	cargo $(1) --manifest-path $(2)/Cargo.toml

endef

$(foreach command,test build publish,$(eval $(call ALL,$(command))))