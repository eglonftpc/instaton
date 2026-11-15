source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.12"

# Rails 8.0 is out of security support. 8.1.4.1 (and newer 8.1 patches) include
# the Active Storage / Action Pack fixes from the 8.0.5.2 security release.
gem "rails", "~> 8.1.4", ">= 8.1.4.1"

# Sprockets still serves this app's CSS and the drag-and-drop engine assets.
# Webpacker and sass-rails do not run on Rails 8; Bootstrap 4 CSS is vendored.
gem "sprockets-rails"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 6.4"
gem "turbo-rails"
gem "bootsnap", require: false

gem "devise", "~> 5.0"
gem "active_storage_drag_and_drop"

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "bundler-audit", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: %i[windows jruby]
