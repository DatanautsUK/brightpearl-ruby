# Brightpearl Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brightpearl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brightpearl

## Usage

### First configure your connection

 - single Brightpearl instance

```ruby
Brightpearl.configure do |config|
 config.datacenter = 'ws-eu1'
 config.account = 'mycompany'
 config.app_ref = 'my_app_ref'
 config.account_token = 'my_account_token'
end
```

**OR**

```ruby
Brightpearl.configure {}
```
_which will use environment variables:

```
BRIGHTPEARL_DATACENTER
BRIGHTPEARL_ACCOUNT
BRIGHTPEARL_APP_REF
BRIGHTPEARL_ACCOUNT_TOKEN
```

 - multiple Brightpearl instances

```ruby
Brightpearl.configure('uk') do |config|
 config.datacenter = 'ws-eu1'
 config.account = 'myuksite'
 config.app_ref = 'app_ref-uk'
 config.account_token = 'account_token-uk'
end

Brightpearl.configure('eu') do |config|
 config.datacenter = 'ws-eu'
 config.account = 'myeurosite'
 config.app_ref = 'app_ref-eu'
 config.account_token = 'account_token-eu'
end

```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DatanautsUK/brightpearl.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

