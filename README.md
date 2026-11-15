# Instaton

A small image-posting app. Users sign up with Devise, upload a picture, and browse recent posts.

## Requirements

* Ruby 3.4.12 (see `.ruby-version`)
* Bundler 2.x
* SQLite 3

## Setup

```
bundle install
bin/rails db:prepare
bin/rails server
```

Production needs `SECRET_KEY_BASE` (or `config/master.key`, which is not in git) and, for password-reset links, `MAILER_HOST`. Set `RAILS_SERVE_STATIC_FILES=1` when the app process should serve CSS and JavaScript. Run `bin/rails db:migrate` on existing databases so the Active Storage tables exist before anyone uploads.

## Tests

```
bin/rails test
bundle exec bundle-audit check --update
```
