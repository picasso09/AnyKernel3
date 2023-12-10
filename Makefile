NAME ?= DiscussionVerse

DATE := $(shell date "+%Y%m%d-%H%M")

CODE := RedValvet

ZIP := $(NAME)-$(CODE)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating MD5..."
	@md5sum "$@" > "$@.md5"
	@cat "$@.md5"
	@echo "Done."


clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@rm -vf modules/vendor/lib/modules/*.ko
	@rm -vf modules/vendor/lib/modules/pronto/*.ko
	@echo "Done."


