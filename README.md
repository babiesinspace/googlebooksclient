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

If you'd like to filter that search, the volumes method can also take an additional options parameter with filters. This should be in the form of a Hash, with each key a search filter made available by [Google Books](https://developers.google.com/books/docs/v1/using#PerformingSearch). The keys may be Strings or Symbols.

    $ client.volumes("Harry", {"inauthor": "rowling", intitle: "Goblet"})

You may also search ONLY with filters, but then you must pass an empty string as the first argument. So using the above example would look like:

    $ client.volumes("", {"inauthor": "rowling", intitle: "Goblet"})

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/babiesinspace/googlebooksclient.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
