[![Build Status](https://travis-ci.org/mknapik/twfhackaton.svg)](https://travis-ci.org/mknapik/twfhackaton)
[![Code Climate](https://codeclimate.com/github/mknapik/twfhackaton/badges/gpa.svg)](https://codeclimate.com/github/mknapik/twfhackaton)
[![Test Coverage](https://codeclimate.com/github/mknapik/twfhackaton/badges/coverage.svg)](https://codeclimate.com/github/mknapik/twfhackaton/coverage)
[![Dependency Status](https://gemnasium.com/mknapik/twfhackaton.svg)](https://gemnasium.com/mknapik/twfhackaton)
[![Heroku](https://heroku-badge.herokuapp.com/?app=code-divers)](https://code-divers.herokuapp.com)

# Development

## Vagrant

### Prerequisites

* Vagrant - 1.7.4
* VirtualBox - 5.0.0

### Setup

```bash
vagrant up
```

```bash
vagrant ssh
cd /vagrant
```

## Local setup

### Prerequisites

* Ruby - 2.2.3
* NodeJS - 0.12.7
* [LiveReload](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en) - recommended
* Sqlite3 or PostgreSQL 9

### Setup

```bash
bundle
bundle exec rake db:setup db:seed
```

## Run

Run test suite:

```bash
bundle exec rake
```

Run [Guard](https://github.com/guard/guard):

```bash
bundle exec guard
# or for Vagrant
bundle exec guard -p -l 1
```

Start web application:

```bash
bundle exec rails server -b 0.0.0.0
```
