require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku/modifier'))
require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku/builder'))
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
    Builder.new(sudoku)
  end
end
