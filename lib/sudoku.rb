require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku/sudoku'))
require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku/builder'))
require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku/solver' ))
require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku/version'))

module Sudoku
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
