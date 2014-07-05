# FirstAndOnly

Get the first element from an enumerable, and assert that there is only one element to take.

```
[:just_one].first_and_only!  # => :just_one
```

```
[].first_and_only!  # =>  0 (Enumerable::FirstAndOnly::LengthNotOne)
```

```
[:one, :and_two].first_and_only!  # => 2 (Enumerable::FirstAndOnly::LengthNotOne)
```

## Why?

Sometimes in a spec you have a collection object that you know only has one element.  You set it up this way.  Later spec refactors may accidentally introduce a second element.  To prevent accidental false positives, and to make fixing failures introduced by this easier, you can use `#first_and_only!` to codify the "there is only one" assumption.

Another common use case for `#first_and_only` is `id` assertions on HTML documents.  A valid HTML document can only have one occurrence of each `id` attribute, but authoring tools and browsers don't typically enforce this.  If you hang your JavaScript of the "only one" assumption of `id` attributes, you should enforce this with a specification.

This gem follows the same line of thinking as the [fetching gem](https://github.com/covermymeds/fetching-gem)

## Installation

Add this line to your application's Gemfile:

```
gem 'first_and_only'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install first_and_only
```

## Running specs

```
bundle exec rspec
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
