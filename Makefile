NAME ?= DiscussionVerse

DATE := $(shell date "+%Y%m%d-%H%M")
CODE := GKI-5.10
KSU  := $(shell bash -c 'read -p "Use KSU? (y/n): " do; echo $$do')

ifeq ($(KSU),y)
    ETC := KSU-NEXT-LTO
else
    ETC := LTO
endif

ZIP := $(NAME)-$(CODE)-$(ETC)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md* tele.sh changelog.txt

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating MD5..."
	@md5sum "$@" > "$@.md5"
	@cat "$@.md5"
	@./tele.sh "$@ changelog.txt
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf Image.gz
	@rm -vf modules/vendor/lib/modules/*.ko
	@rm -vf modules/vendor/lib/modules/pronto/*.ko
	@echo "Done."
