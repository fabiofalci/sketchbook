
.PHONY: sort langton_ant heartbeat terrain

heartbeat:
	processing-java --sketch=$(CURDIR)/heartbeat --output=/tmp/output --force --run

sort:
	processing-java --sketch=$(CURDIR)/sort --output=/tmp/output --force --run

langton_ant:
	processing-java --sketch=$(CURDIR)/langton_ant --output=/tmp/output --force --run

terrain:
	processing-java --sketch=$(CURDIR)/terrain --output=/tmp/output --force --run

