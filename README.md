# BellyPlatformStringValidations

This gem adds some basic string validation and coercion methods into the BellyPlatform

## Installation

Add this line to your application's Gemfile:

    gem 'belly_platform_string_validations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install belly_platform_string_validations

## Usage

### Validation

The `validate` method will check the following types and return either `true` or `false`:

`integer`,`int`,`boolean`,`date`,`timestamp`,`double`,`array_of_integers`,`array_of_ints`,`array_of_strings`,`snake_case`,`geopoint`,`string`

```
BellyPlatform::String.validate('integer', '123')
=> true
```

The `coerce` method will attempt to coerce the following types:

`integer`,`int`,`boolean`,`double`,`array_of_integers`,`array_of_ints`,`array_of_strings`,`timestamp`

```
BellyPlatform::String.coerce('integer', '123')
=> 123
```

The `Boolean` class provides methods to interpret a wide range of truthy and falsy values as boolean:

```
TRUTHY_VALUES = [true, "true", "t", "yes", "yep", "yea", "y", 1, "1"]
FALSY_VALUES  = [false, "false", "f", "no", "nope", "na", "n", 0, "0"]
```

```
BellyPlatform::Boolean.convert('yes')
=> true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

