# Proplog - Ruby Propositional Logic

Proplog is a ruby library for working with propositional [Propositional Logic](http://en.wikipedia.org/wiki/Propositional_calculus).


## Installation

Add this line to your application's Gemfile:

    gem 'proplog', git: 'https://github.com/mikeyhogarth/proplog.git'

And then execute:

    $ bundle


## Usage

### Expressions

Proplog represents expressions using the GOF interpreter pattern. Expression classes
are all namespaced under Proplog::Expression. The following types of expression are 
represented:

    Proplog::Expression::Conjunction   # AND
    Proplog::Expression::Disjunction   # OR
    Proplog::Expression::Implication   # THEN
    Proplog::Expression::Negation      # NOT
    Proplog::Expression::Atom          # ATOMIC SYMBOL


### Building Expressions

Expressions are built up like so:

    expr1 = Proplog::Expression::Atom.new("foo")
    expr2 = Proplog::Expression::Atom.new("bar")
    expr3 = Proplog::Expression::Conjunction.new(expr1, expr2)
    expr3.to_s
    => "foo ∧ bar"


### Parsing Expressions

Proplog includes a simple expression parser for converting strings into expressions. Usage is like so:

    parser = Proplog::Expression::Parser.new
    parser.parse("foo & bar")

a convinience method also exists at class level:

    Proplog::Expression::Parser.parse("foo & bar")

In its present form, spaces are important as these are what it uses to split up an expression.

The parser will check syntax and intelligently establish binding precedence of the various operators. You can use "rubyish" syntax, verbose english syntax or actual propositional logic syntax and the parser will understand. Operators are therefore:

    conjunction: "&", "&&", "AND" or "∧"
    disjunction: "|", "||", "OR" or "∨"
    implication: "->" or "→" 
    negation: "!" or "¬"
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write specs
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
