Spree Promo User Usage Limit
======================
[![Build Status](http://img.shields.io/travis/swrobel/spree_promo_user_usage_limit/master.svg?style=flat)](https://travis-ci.org/swrobel/spree_promo_user_usage_limit) [![Dependency Status](http://img.shields.io/gemnasium/swrobel/spree_promo_user_usage_limit.svg?style=flat)](https://gemnasium.com/swrobel/spree_promo_user_usage_limit) [![Coverage Status](http://img.shields.io/coveralls/swrobel/spree_promo_user_usage_limit/master.svg?style=flat)](https://coveralls.io/r/swrobel/spree_promo_user_usage_limit) [![Code Climate](http://img.shields.io/codeclimate/github/swrobel/spree_promo_user_usage_limit.svg?style=flat)](https://codeclimate.com/github/swrobel/spree_promo_user_usage_limit)

Adding this rule to a promo will allow you to set a limit on the number of completed orders for which a given user can apply it (default 1 use).

![screenshot](screenshot.png)

Installation
------------

1. Add spree_promo_user_usage_limit to your Gemfile:

  ```ruby
  gem 'spree_promo_user_usage_limit'
  ```

1. Bundle your dependencies:

  ```shell
  bundle
  ```

1. Add this rule to a promo and set the number of uses you want to allow

1. Profit.

TODO
----

* Friendlier error messages when promo can't be applied

Versioning
----------
Versions files the pattern MAJOR.MINOR.PATCH [SemVer-style](http://semver.org/). MAJOR.MINOR version will always match the Spree version that gem is compatible with. PATCH version is incremented as new bugfix releases of this gem come out, indepently of new Spree PATCH versions.

For example, version 2.1.0 is compatible with the Spree 2.1.x series, while version 2.0.0 is compatible with the Spree 2.0.x series.

You should not need to worry about this, as the gemspec has the appropriate constraints. But hey, the more you know.

Testing
-------
This extension is tested against the following rubies:

* 1.9.3
* 2.0
* 2.1
* 2.2
* 2.3
* jruby (experimental)
* rubinius (experimental)

### Running the tests locally

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec
```

License
-------

Copyright (c) 2014 Stefan Wrobel, released under the MIT License
