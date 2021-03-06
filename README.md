# Ruboty::Remu

Let's define bot action by regexp. Many REgexp-actions make bot like jinkou-MUnou. This plugin is inspired by lingr-osusume bot.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-remu', :github => '0xBADDCAFE/ruboty-remu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-remu

## Usage

```
[botname] /remu add (?<name>\S+) (?<regexp>\S+) (?<action>.+)/ - register action
[botname] /remu detail (?<name>\S+)/ - detail regexp action
[botname] /remu list/ - list regexp actions
[botname] /remu remove (?<name>\S+)/ - remove regexp action
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/0xBADDCAFE/ruboty-remu.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

