# Sudoku

This is a sudoku builder that solves and builds sudoku puzzles!

#### Quick Start


```
$ gem install sudoku_builder
$ irb
> require 'sudoku_builder' 
> => true
> SudokuBuilder.new.pretty_print
+-----------------------------+
| 5  9  2 | 7  8  4 | 1  3  6 |
| 6  7  1 | 2  3  9 | 5  4  8 |
| 4  3  8 | 6  1  5 | 2  7  9 |
+-----------------------------+
| 1  8  6 | 4  5  2 | 3  9  7 |
| 3  2  7 | 9  6  1 | 4  8  5 |
| 9  5  4 | 8  7  3 | 6  2  1 |
+-----------------------------+
| 2  1  9 | 5  4  8 | 7  6  3 |
| 8  6  3 | 1  2  7 | 9  5  4 |
| 7  4  5 | 3  9  6 | 8  1  2 |
+-----------------------------+
> SudokuBuilder.new.poke(50, '_').pretty_print
+-----------------------------+
| _  _  _ | _  _  _ | 6  4  _ |
| _  _  _ | _  _  _ | 9  _  _ |
| _  6  2 | _  _  _ | _  _  _ |
+-----------------------------+
| 6  2  _ | 4  7  3 | 5  1  _ |
| 5  3  _ | 8  1  6 | _  7  4 |
| _  1  4 | 5  _  _ | _  8  6 |
+-----------------------------+
| _  _  _ | _  _  _ | _  _  _ |
| _  9  _ | 1  3  _ | 8  _  _ |
| 2  _  _ | 9  _  _ | _  6  _ |
+-----------------------------+
> my_puzzle = SudokuBuilder.new.easy
+-----------------------------+
| _  _  _ | _  _  _ | _  _  6 |
| 6  _  _ | _  _  4 | 5  _  _ |
| _  _  _ | 6  _  5 | 4  _  _ |
+-----------------------------+
| 7  4  _ | _  _  _ | 9  _  5 |
| _  _  _ | 7  _  9 | 2  _  _ |
| _  3  _ | _  2  _ | _  _  _ |
+-----------------------------+
| 4  8  _ | _  5  _ | 6  _  _ |
| _  7  _ | _  _  _ | 3  5  _ |
| 3  5  _ | _  _  7 | _  _  _ |
+-----------------------------+
> SudokuBuilder::Solver.new(my_puzzle).solve.pretty_print
+-----------------------------+
| 5  2  4 | 1  3  8 | 7  9  6 |
| 6  9  3 | 2  7  4 | 5  1  8 |
| 8  1  7 | 6  9  5 | 4  3  2 |
+-----------------------------+
| 7  4  2 | 8  1  3 | 9  6  5 |
| 1  6  5 | 7  4  9 | 2  8  3 |
| 9  3  8 | 5  2  6 | 1  4  7 |
+-----------------------------+
| 4  8  9 | 3  5  2 | 6  7  1 |
| 2  7  6 | 4  8  1 | 3  5  9 |
| 3  5  1 | 9  6  7 | 8  2  4 |
+-----------------------------+
```

## Installation

Add this line to your application's Gemfile:

    gem 'sudoku_builder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sudoku_builder

## Usage

To create a new puzzle:

    SudokuBuilder.new

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

	SudokuBuilder::Solver.new(my_puzzle).solve

`my_puzzle` must be equal to a hash with keys from 0 to 80 where the values are equal to an integer for already given squares and an array for empty squares. ie:


    {0=>6, 1=>8, 2=>[], 3=>[], 4=>[], 5=>[] ...

The builder then goes through guessing numbers for the arrays and leaving the numbers alone.


## Contributing

Contributions are welcome! The solver is currently very slow.

1. Fork it ( https://github.com/ColDog/sudoku/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
