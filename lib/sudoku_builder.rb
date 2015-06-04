require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku_builder/sudoku'))
require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku_builder/builder'))
require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku_builder/solver' ))
require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku_builder/version'))

module SudokuBuilder
  extend self
  def new
    sudoku = { }
    q = 0
    81.times do
      sudoku[q] = []
      q += 1
    end
    Solver.new(sudoku).solve
  end
end
