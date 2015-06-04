require 'spec_helper'

describe Sudoku do

  it 'has a version number' do
    expect(Sudoku::VERSION).not_to be nil
  end

  it 'has correct classes and responds to correct methods' do
    sudoku = Sudoku.new
    expect(sudoku.class).to eq(Sudoku::Builder)
    expect(Sudoku::Solver.new(sudoku).class).to eq(Sudoku::Solver)
    expect(sudoku).to respond_to(:medium)
    expect(sudoku).to respond_to(:valid)
  end

  it 'can solve a partially filled puzzle' do
    sudoku = {0=>3, 1=>[], 2=>4, 3=>[], 4=>[], 5=>[], 6=>[], 7=>[], 8=>[], 9=>[], 10=>8, 11=>1, 12=>[], 13=>[], 14=>6, 15=>[], 16=>[], 17=>[], 18=>[], 19=>7, 20=>[], 21=>8, 22=>[], 23=>[], 24=>[], 25=>1, 26=>[], 27=>5, 28=>2, 29=>[], 30=>1, 31=>[], 32=>8, 33=>[], 34=>[], 35=>[], 36=>4, 37=>1, 38=>[], 39=>[], 40=>[], 41=>9, 42=>[], 43=>2, 44=>[], 45=>9, 46=>6, 47=>[], 48=>2, 49=>[], 50=>[], 51=>7, 52=>[], 53=>1, 54=>[], 55=>9, 56=>[], 57=>[], 58=>8, 59=>[], 60=>[], 61=>[], 62=>[], 63=>[], 64=>[], 65=>[], 66=>3, 67=>6, 68=>[], 69=>[], 70=>[], 71=>[], 72=>[], 73=>[], 74=>2, 75=>[], 76=>[], 77=>[], 78=>[], 79=>[], 80=>[]}
    new_sudoku = Sudoku::Solver.new(sudoku).solve
    expect(new_sudoku.class).to eq(Sudoku::Builder)
    expect(new_sudoku.valid).to eq(true)
  end

end
