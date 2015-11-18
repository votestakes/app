# Requirements

- Ruby 2.2.2 (`$ rbenv install 2.2.2`)
- Bundler (`$ gem install bundler`)
- Postgres (`$ brew install postgres`)

# Setup

Create a development database:

```sh
createdb votestakes_dev
```

# Running

```sh
make db
make run
```
