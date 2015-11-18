BE := bundle exec
FOREMAN := $(BE) foreman
RSPEC := $(BE) rspec

# MAIN TARGETS #################################################################

.PHONY: all
all: install

.PHONY: ci
ci: check

# RUN SERVER ###################################################################

HOST = $(shell ipconfig getifaddr en0 || ipconfig getifaddr en1)
PORT ?= 8000

.PHONY: run
run: install
	$(FOREMAN) start --procfile Procfile.dev --port $(PORT)

.PHONY: launch
launch: install
	eval "sleep 5; open http://$(HOST):$(PORT)" & make run

# INSTALL DEPENDENCIES #########################################################

VENDOR_DIR := vendor
INSTALLED_FLAG := $(VENDOR_DIR)/.installed

.PHONY: install
install: $(INSTALLED_FLAG)
$(INSTALLED_FLAG): Gemfile* Makefile
	bundle install --path vendor
	@ touch $(INSTALLED_FLAG)  # indicate that dependencies are installed

.PHONY: update
update: install
	bundle update
	@ touch $(INSTALLED_FLAG)  # indicate that dependencies are installed

# UNIT TESTS  ##################################################################

.PHONY: test
test: install
	$(RSPEC) spec

# CLEANUP ######################################################################

.PHONY: clean
clean:

.PHONY: clean-all
clean-all: clean
	rm -rf .bundle $(VENDOR_DIR)
