# ArchangelApi

**ArchangelApi is currently under development. It is not ready for production use.**

[![Travis CI](https://travis-ci.org/archangel/archangel_api.svg?branch=master)](https://travis-ci.org/archangel/archangel_api)
[![Coverage Status](https://coveralls.io/repos/github/archangel/archangel_api/badge.svg?branch=master)](https://coveralls.io/github/archangel/archangel_api?branch=master)
[![Code Climate](https://codeclimate.com/github/archangel/archangel_api/badges/gpa.svg)](https://codeclimate.com/github/archangel/archangel_api)
[![Dependency Status](https://gemnasium.com/badges/github.com/archangel/archangel_api.svg)](https://gemnasium.com/github.com/archangel/archangel_api)

This project rocks and uses MIT-LICENSE.

## Table of contents

* [Installation](#installation)
* [Updating](#updating)
* [Testing](#testing)
* [Extending](#extending)
* [Contributing](#contributing)

## Installation

Add to your application's Gemfile

```
gem "archangel_api", github: "archangel/archangel_api"
```

Run the bundle command

```
bundle install
```

Run the install generator

```
bundle exec rails g archangel_api:install
```

If your server was running, restart it to find the assets properly.

## Updating

Subsequent updates can be done by bumping the version in your Gemfile then adding the new migrations

```
bundle exec rails archangel_api:install:migrations
```

Run migrations

```
bundle exec rails db:migrate
```

## Testing

First, generate a dummy application. You will be required to generate a dummy application before running tests.

```
bundle exec rake dummy_app
```

Run tests

```
bundle exec rake
```

or

```
bundle exec rake spec
```

or

```
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories. Simply add this require statement to your spec_helper:

```
require "archangel_api/factories"
```

## Extending

In your `rails_helper.rb` file add this below `require "archangel/testing_support/support"` to add API Rspec testing support

```
require "archangel_api/testing_support/support"
```

## Contributing

1. Fork it ( https://github.com/archangel/archangel_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
