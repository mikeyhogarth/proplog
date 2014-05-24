# Proplog - Ruby Propositional Logic

Proplog is a ruby library for working with propositional [Propositional Logic](http://en.wikipedia.org/wiki/Propositional_calculus).

## Installation

Add this line to your application's Gemfile:

    gem 'proplog', git: 'https://github.com/mikeyhogarth/proplog.git'

And then execute:

    $ bundle

## Usage

### Building Expressions

Expressions are stored using the interpreter pattern and can be built up like so:

    expr1 = Proplog::Expression::Atom.new("foo")
    expr2 = Proplog::Expression::Atom.new("bar")
    expr3 = Proplog::Expression::Conjunction.new(expr1, expr2)
    expr3.to_s
    => "foo ∧ bar"


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write specs
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
