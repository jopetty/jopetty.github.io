.POSIX:
.PHONY: render clean

# Locations
INPUT = website
OUTPUT = docs

# External tool configurations
TIDY_CONFIG = tidy.config
TIDY = tidy -modify -config $(TIDY_CONFIG)

default: render index.html publish

render:
	raco pollen render -r $(INPUT)

publish:
	raco pollen publish $(INPUT) $(OUTPUT)
	find $(OUTPUT) -name template.html -type f -delete
	$(TIDY) $(OUTPUT)/*.html || true

clean:
	raco pollen reset

index.html: $(INPUT)/index.html.pm 
	raco pollen render -f $(INPUT)/index.html.pm
