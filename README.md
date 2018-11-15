# Googlebooksclient

This is my first gem that I wrote as a simple Google Books API Client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'googlebooksclient'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install googlebooksclient

## Usage

Add the gem to your Gemfile and bundle. You can then instantiate a new Googlebooksclient::Client object like so:

    $ client = Googlebooksclient::Client.new

And then perform a simple Volume search:

    $ client.volumes("The Wheel of Time")

Which will return an array of books!

Very simple so start, but hopefully I will build off of this base in the next version.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/babiesinspace/googlebooksclient.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
