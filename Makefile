BE := bundle exec
FOREMAN := $(BE) foreman
RSPEC := $(BE) rspec

BIN := bin
RAKE := $(BIN)/rake

# MAIN TARGETS #################################################################

.PHONY: all
all: env install

.PHONY: ci
ci: test

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

.PHONY: install
install: vendor/bundler
vendor/bundler: Gemfile* Makefile
	bundle install --path vendor/bundler
	@ touch $@

.PHONY: update
update: install
	bundle update
	@ touch vendor/bundler

# DATABASE #####################################################################

.PHONY: db
db: install
	- createdb votestakes_dev
	$(RAKE) db:migrate RAILS_ENV=development

.PHONY: db-test
db-test: install
	- createdb votestakes_test
	$(RAKE) db:migrate RAILS_ENV=test

# TESTS  #######################################################################

.PHONY: test
test: install db-test
	$(RSPEC) spec

# CLEANUP ######################################################################

.PHONY: clean
clean:
	rm -rf .env

.PHONY: clean-all
clean-all: clean
	rm -rf .bundle vendor/bundler
