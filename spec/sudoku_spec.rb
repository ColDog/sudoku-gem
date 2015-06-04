require 'spec_helper'

describe Sudoku do

  it 'has a version number' do
    expect(Sudoku::VERSION).not_to be nil
  end

  it 'has correct classes' do
    sudoku = Sudoku.new
    expect(sudoku.class).to eq(Sudoku::Builder)
    pp sudoku.class
  end



end
