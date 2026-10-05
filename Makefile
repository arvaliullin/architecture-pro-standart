PLANTUML ?= plantuml

SCHEMA_DIR := schemas
IMAGE_DIR := $(SCHEMA_DIR)/images
PUML_FILES := $(wildcard $(SCHEMA_DIR)/*.puml)
PNG_FILES := $(patsubst $(SCHEMA_DIR)/%.puml,$(IMAGE_DIR)/%.png,$(PUML_FILES))

.PHONY: render clean

render: $(PNG_FILES)

$(IMAGE_DIR)/%.png: $(SCHEMA_DIR)/%.puml
	@mkdir -p $(IMAGE_DIR)
	$(PLANTUML) -tpng -o images $<

clean:
	rm -f $(PNG_FILES)
