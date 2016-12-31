<h1 align="center">rspec-api-docs</h1>

<p align="center">Generate API documentation using RSpec</p>

<p align="center">
  <a href="https://travis-ci.org/twe4ked/rspec-api-docs"><img src="https://img.shields.io/travis/twe4ked/rspec-api-docs.svg?style=flat-square" /></a>
  <a href="https://rubygems.org/gems/rspec-api-docs"><img src="https://img.shields.io/gem/v/rspec-api-docs.svg?style=flat-square" /></a>
  <a href="http://www.rubydoc.info/github/twe4ked/rspec-api-docs/master"><img src="https://img.shields.io/badge/docs-master-lightgrey.svg?style=flat-square" /></a>
</p>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-api-docs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-api-docs

## Usage

**rspec-api-docs** works in two stages. The first stage introduces a new DSL
method, `doc`, to include in your RSpec specs.

``` ruby
require 'rspec_api_docs/dsl'

RSpec.describe 'Characters' do
  include RspecApiDocs::Dsl

  # ...
end
```

The `doc` method stores data in a hash on the RSpec example metadata.

The second stage is the formatter (`RspecApiDocs::Formatter`). The formatter
parses the hash stored on each RSpec example and uses a renderer
(lib/rspec_api_docs/formatter/renderer/) to write out your documentation.

```
bundle exec rspec spec/requests/characters_spec.rb --formatter=RspecApiDocs::Formatter
```

### DSL

First, require the DSL and include the DSL module.

You can do this in your `spec_helper.rb`:

``` ruby
require 'rspec_api_docs/dsl'

RSpec.configure do |config|
  config.include RspecApiDocs::Dsl, type: :request

  # ...
end
```

Or in individual specs:


``` ruby
require 'rspec_api_docs/dsl'

RSpec.describe 'Characters' do
  include RspecApiDocs::Dsl

  # ...
end
```

You also need to require a lambda that runs after each expectation:

``` ruby
require 'rspec_api_docs/after'

RSpec.configure do |config|
  config.after &RspecApiDocs::After::Hook
end
```

This automatically stores the `last_request` and `last_response` objects for
use by the formatter.

**rspec-api-docs** doesn't touch any of the built-in RSpec DSL methods.
Everything is contained in the `doc` block.

You can use RSpec `before` blocks to share setup between multiple examples.

``` ruby
require 'rspec_api_docs/dsl'

RSpec.describe 'Characters' do
  include RspecApiDocs::Dsl

  before do
    doc do
      resource_name 'Characters'
      resource_description <<-EOF
        Characters inhabit the Land of Ooo.
      EOF
    end
  end

  describe 'GET /characters/:id' do
    it 'returns a character' do
      doc do
        name 'Fetching a Character'
        description 'For getting information about a Character.'
        path '/characters/:id'

        field :id, 'The id of a character', scope: :character, type: 'integer'
        field :name, "The character's name", scope: :character, type: 'string'
      end

      get '/characters/1'

      # normal expectations ...
    end

    # ...
  end
end
```

#### `resource_name`

Accepts a string of the name of the resource.

> Characters

#### `resource_description`

Accepts a string that describes the resource.

> Characters inhabit the Land of Ooo.

#### `name`

Accepts a string of the name of the resource.

> Fetching a character

Note: This defaults to the "description" of the RSpec example.


``` ruby
it 'Fetching a character' do
  # ...
end
```

#### `description`

Accepts a string that describes the example.

> To find out information about a Character.

#### `path`

Accepts a string for the path requested in the example.

> /characters/:id

Note: This defaults to the path of the first route requested in the example.

#### `field`

Accepts a `name`, `description`, and optionally a `scope` and `type`.

- `name` [`Symbol`] the name of the response field
- `description` [`String`] a description of the response field
- `scope` [`Symbol`, `Array<Symbol>`] _(optional)_ how the field is scoped
- `type` [`String`] _(optional)_ the type of the returned field

This can be called multiple times for each response field.

``` ruby
field :id, 'The id of a character', scope: :character, type: 'integer'
field :name, "The character's name", scope: :character, type: 'string'
```

#### `param`

Accepts a `name`, `description`, and optionally a `scope`, `type`, and `required` flag.

- `name` [`Symbol`] the name of the parameter
- `description` [`Symbol`] a description of the parameter
- `scope` [`Symbol`, `Array<Symbol>`] _(optional)_ how the parameter is scoped
- `type` [`String`] _(optional)_ the type of the parameter
- `required` [`Boolean`] _(optional)_ if the parameter is required

This can be called multiple times for each parameter.

``` ruby
param :id, 'The id of a character', scope: :character, type: 'integer', required: true
param :name, "The character's name", scope: :character, type: 'string'
```

See the integration specs for more examples of the DSL in use.

### Formatter

The formatter can be configured in your `spec_helper.rb`:

``` ruby
# Defaults are shown

RspecApiDocs.configure do |config|
  # The output directory for file(s) created by the renderer.
  config.output_dir = 'docs'

  # One of :json, :raddocs, or :slate.
  # This can also be a class that quacks like a renderer.
  # A renderer is initialized with an array of `Resource`s and a `#render`
  # method is called.
  config.renderer = :json
end
```

See [the documentation](http://www.rubydoc.info/github/twe4ked/rspec-api-docs/master).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org].

Regenerate this project's integration spec docs locally:

```
./bin/generate_integration_docs
```

## TODO

- Allow specifying an order (`precedence`?)

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/twe4ked/rspec-api-docs. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant] code of
conduct.

## License

The gem is available as open source under the terms of the [MIT License].

[MIT License]: http://opensource.org/licenses/MIT
[Contributor Covenant]: http://contributor-covenant.org
[rubygems.org]: https://rubygems.org
