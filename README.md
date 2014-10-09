# Partial Path Customizer

[![Build Status](https://travis-ci.org/animascodelabs/partial_path_customizer.svg?branch=master)](https://travis-ci.org/animascodelabs/partial_path_customizer)

Partial Path Customizer allows you to override `#to_partial_path` for a Rails model at runtime.

## Installation & Upgrading

This gem is a railtie and is meant to be used with Rails. It is tested with versions of Rails down to 3.2.

Partial Path Customizer is recommended to be run as a gem and included in your Gemfile:

```ruby
gem 'partial_path_customizer'
```

## Helper

Partial path customizers provides a helper method to automatically set the partial path for the object
you want to render. Here is how you would render an object normally.

```erb
<%= render @bike %>
```

This would render the `bikes/bike` partial. Now if you want to customize the partial path, use the
`customize_partial_path` like this.

```erb
<%= render customize_partial_path(@bike, 'summary') %>
```

This renders the `bikes/summary` partial instead.


## License

Partial Path Customizer is Copyright &copy; 2014 Animas Code Labs. It is free software, and may be redistributed
under the terms specified in the LICENSE file.
