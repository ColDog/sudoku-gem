# Sudoku

This is a sudoku builder that solves and builds sudoku puzzles!

#### Quick Start

`gem install sudoku_builder`

```
    $ irb
    > require 'sudoku_builder' => true
    > SudokuBuilder.new.poke(50, '_').pretty_print
    >	+-----------------------------+
    >	| _  _  _ | _  _  _ | 6  4  _ |
    >	| _  _  _ | _  _  _ | 9  _  _ |
    >	| _  6  2 | _  _  _ | _  _  _ |
    >	+-----------------------------+
    >	| 6  2  _ | 4  7  3 | 5  1  _ |
    >	| 5  3  _ | 8  1  6 | _  7  4 |
    >	| _  1  4 | 5  _  _ | _  8  6 |
    >	+-----------------------------+
    >	| _  _  _ | _  _  _ | _  _  _ |
    >	| _  9  _ | 1  3  _ | 8  _  _ |
    >	| 2  _  _ | 9  _  _ | _  6  _ |
    >	+-----------------------------+
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sudoku_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sudoku_builder

## Usage

To create a new puzzle:

`SudokuBuilder.new`

This will return a `SudokuBuilder::Builder` object that looks like this:

	```ruby
	#<SudokuBuilder::Builder:0x007fdc729373e8 @sud={0=>[6], 1=>[8], 2=>[9], 3=>[5], 4=>[7], 5=>[2], 6=>[3], ...
	```

On the builder object you can call a handful of different methods:

- `valid?` checks if the sudoku is valid.
- `to_hash` turns it into a regular hash.
- `poke(number, poke_with)` pokes holes in the puzzle. (to create a solvable sudoku)
- `medium`, `easy` and `hard` poke a set number of holes in the puzzle.
- `pretty_print` makes it print out nice on the command line.

To solve an existing puzzle, call:

	`SudokuBuilder::Solver.new(my_puzzle)`

`my_puzzle` must be equal to a hash with keys from 0 to 80 where the values are equal to an integer for already given squares and an array for empty squares. ie:

	```
	{0=>6, 1=>8, 2=>[], 3=>[], 4=>[], 5=>[], 6=>[3] ...
	```
The builder then goes through guessing numbers for the arrays and leaving the numbers alone.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Contributions are welcome! The solver is currently very slow.

1. Fork it ( https://github.com/ColDog/sudoku/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
