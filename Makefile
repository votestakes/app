BE := bundle exec
FOREMAN := $(BE) foreman
RSPEC := $(BE) rspec

BIN := bin
RAKE := $(BIN)/rake

# MAIN TARGETS #################################################################

.PHONY: all
all: env install

.PHONY: ci
ci: check

# RUN SERVER ###################################################################

HOST := localhost
PORT ?= 3000

.PHONY: run
run: env install
	$(FOREMAN) start --procfile Procfile.dev --port $(PORT)

.PHONY: launch
launch: install
	eval "sleep 5; open http://$(HOST):$(PORT)" & make run

.PHONY: env
env: .env
.env:
	# test app credentials
	echo "FACEBOOK_APP_ID=1658321967767771" >> .env
	echo "FACEBOOK_SECRET=53d6f8b23341d5423c35e9812ba15f42" >> .env

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

# DATABASE #####################################################################

.PHONY: db
db: install
	$(RAKE) db:migrate RAILS_ENV=development

# UNIT TESTS  ##################################################################

.PHONY: test
test: install
	$(RSPEC) spec

# CLEANUP ######################################################################

.PHONY: clean
clean:
	rm -rf .env

.PHONY: clean-all
clean-all: clean
	rm -rf .bundle $(VENDOR_DIR)
