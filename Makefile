
.PHONY: sort langton_ant

sort:
	processing-java --sketch=$(CURDIR)/sort --output=/tmp/output --force --run

langton_ant:
	processing-java --sketch=$(CURDIR)/langton_ant --output=/tmp/output --force --run

