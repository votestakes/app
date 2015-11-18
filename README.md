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

How do I create a new (x)

```sh
bundle exec rails g --help
```

How do I learn about Ruby/Rails?

* http://ruby-doc.org/core-2.2.0/
* http://api.rubyonrails.org/classes/Array.html
* http://railscasts.com/
