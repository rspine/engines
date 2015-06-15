# Spine::Engines

[![Gem Version](https://badge.fury.io/rb/spine-engines.svg)](http://badge.fury.io/rb/spine-engines)
[![Dependency Status](https://gemnasium.com/rspine/engines.svg)](https://gemnasium.com/rspine/engines)
[![Code Climate](https://codeclimate.com/github/rspine/engines/badges/gpa.svg)](https://codeclimate.com/github/rspine/engines)
[![security](https://hakiri.io/github/rspine/engines/master.svg)](https://hakiri.io/github/rspine/engines/master)
[![Inline docs](http://inch-ci.org/github/rspine/engines.svg?branch=master)](http://inch-ci.org/github/rspine/engines)

Starting point for your Rack application and its configurations.

## Installation

To install it, add the gem to your Gemfile:

```ruby
gem 'spine-engines'
```

Then run `bundle`. If you're not using Bundler, just `gem install spine-engines`.

## Usage

Define your application and configuration:

```ruby
# lib/my_app/application.rb

module MyApp
  module Application
    extend Spine::Engines::Application
    extend self

    # Add loaders
    loaders << Spine::Engines::Loaders::Initializers

    # Add extensions
    extension Spine::Routing::Engine

    # Add your own extra configuration
    def active_record
      ::ActiveRecord::Base
    end
  end
end
```

Define your shared configuration between environments. You can define
environment specific configurations in `config/environments/evironment_name.rb`.

```ruby
# config/environment.rb

require File.expand_path('../boot', __FILE__)

environment = ENV['RACK_ENV'] || 'development'
Bundler.require(:default, environment)

require File.expand_path('../../lib/my_app/application', __FILE__)

MyApp::Application.configure do |config|
  config.environment = environment
  config.root = File.expand_path('../..', __FILE__)

  config.load_paths = %w(
    lib/my_app/**/*.rb
  )

  # Middlewares
  config.middleware.use Rack::Lock
  config.middleware.use Rack::Runtime
  config.middleware.use Rack::MethodOverride
  config.middleware.use Rack::CommonLogger, config.logger
  config.middleware.use Rack::Head
  config.middleware.use Rack::ConditionalGet
  config.middleware.use Rack::ETag
end

MyApp::Application.initialize!
```

Add Bundler to boot:

```ruby
# config/boot.rb

require 'rubygems'

# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../../Gemfile', __FILE__)
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)
```

Configuring Rack to use this application:

```ruby
# config.ru

require ::File.expand_path('../config/environment',  __FILE__)
run MyApp::Application
```
