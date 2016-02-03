# VoteStakes

[![Build Status](https://travis-ci.org/votestakes/votestakes-app.svg?branch=master)](https://travis-ci.org/votestakes/votestakes-app)
[![Stories in Ready](https://badge.waffle.io/votestakes/votestakes-app.svg?label=ready&title=stories)](http://waffle.io/votestakes/votestakes-app)
[![Slack Status](https://slackin-votestakes.herokuapp.com/badge.svg)](https://slackin-votestakes.herokuapp.com)

What do I install?

```sh
rbenv install 2.2.2
gem install bundler
bundle install
```

How do I set up the database?

```sh
createdb votestakes_dev
bin/rake db:migrate RAILS_ENV=development
```

How do I run localhost?

```sh
bundle exec foreman start -f Procfile.dev
```

How do I run tests?

```sh
bundle exec rspec spec
```

How do I create a new (x)?

```sh
bundle exec rails g --help
```

Create a migration whenever making database changes
* http://edgeguides.rubyonrails.org/active_record_migrations.html

```sh
bundle exec rails g migration change_some_database_stuff
```

How do I learn about Ruby/Rails?

* http://ruby-doc.org/core-2.3.0/
* http://api.rubyonrails.org/classes/Array.html
* http://railscasts.com/
* http://rubykoans.com/
