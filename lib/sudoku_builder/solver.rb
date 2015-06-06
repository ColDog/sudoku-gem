require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku'))
require File.expand_path(File.join(File.dirname(__FILE__), 'builder'))

module SudokuBuilder
  class Solver < Sudoku

    def initialize(sudoku = nil)
      @sud = sudoku
      @used = {
        0=> [], 1=> [], 2=> [], 3=> [], 4=> [], 5=> [], 6=> [], 7=> [], 8=> [],
        9=> [], 10=>[], 11=>[], 12=>[], 13=>[], 14=>[], 15=>[], 16=>[], 17=>[],
        18=>[], 19=>[], 20=>[], 21=>[], 22=>[], 23=>[], 24=>[], 25=>[], 26=>[],
        27=>[], 28=>[], 29=>[], 30=>[], 31=>[], 32=>[], 33=>[], 34=>[], 35=>[],
        36=>[], 37=>[], 38=>[], 39=>[], 40=>[], 41=>[], 42=>[], 43=>[], 44=>[],
        45=>[], 46=>[], 47=>[], 48=>[], 49=>[], 50=>[], 51=>[], 52=>[], 53=>[],
        54=>[], 55=>[], 56=>[], 57=>[], 58=>[], 59=>[], 60=>[], 61=>[], 62=>[],
        63=>[], 64=>[], 65=>[], 66=>[], 67=>[], 68=>[], 69=>[], 70=>[], 71=>[],
        72=>[], 73=>[], 74=>[], 75=>[], 76=>[], 77=>[], 78=>[], 79=>[], 80=>[]
      }
    end

    def solver_pristine
      @sud
    end

    def solve
      t = 0 ; o = 0 ; key = 0               # main key and metric vars.
      direction = true                      # indicates the direction in case of a backtrack on number.
      sud   = solver_pristine
      used  = pristine
      if sud.nil?
        'Sudoku entered is not valid/
         does not exist.'
      else
        loop do
          if sud[key].class == Array        # skips pre-filled numbers.
            c = [] ; r = [] ; g = []        # build values for current grid, row, column.
            build_crg(key,c,r,g,sud)        # updates the relevant variables for check.
            sud[key] = []                   # makes a fresh possibilities array.
            for i in 1..9
              if check?(i, c,r,g) &&
                  !used[key].include?(i)
                sud[key] << i
              end
            end
            if sud[key].count == 0          # backtrack if no possibilities.
              key -= 1
              direction = false             # setting backtrack to false sends the key down if the
            else                            # next number down is a fixnum.
              use = sud[key].sample         # pick a random possibility.
              sud[key]   = [use]            # uses the possibility.
              used[key] << use              # also puts it into the used array.
              key += 1
              direction = true
            end
          elsif sud[key].class == Fixnum
            direction ? key += 1 : key -= 1 # backt or forward track based on current direction.
          end
          if key == 0 || t > 104 ||
                  key == 1 && t > 3         # resets everything if we've reached a high amount
            sud = solver_pristine
            used = pristine
            key = 0 ; t = 0
            direction = true
          end
          break if key == 81                # break if we've reached the last value.
          t += 1 ; o += 1                   # add the reporting variables.
          break if o > 10000000             # there is the possibility to be given an unsolvable.
        end
        Builder.new(@sud)
      end
    end

    def create
      sud = pristine
      used = pristine
      t = 0 ; o = 0 ; key = 0               # main key and metric variables
      loop do
        c = [] ; r = [] ; g = []            # build values for current grid, row, column.
        build_crg(key,c,r,g,sud)            # updates the relevant variables for check.
        sud[key] = []                       # makes a fresh possibilities array.
        for i in 1..9
          if check?(i,c,r,g) &&
                !used[key].include?(i)
            sud[key] << i
          end
        end
        if sud[key].count == 0              # backtrack if no possibilities.
          key -= 1
        else
          use = sud[key].sample             # pick a random possibility.
          sud[key]   = [use]                # uses the possibility.
          used[key] << use                  # also puts it into the used array.
          key += 1
        end
        if key == 0 || t > 104              # resets everything if we've reached a high count.
          sud = pristine
          used = pristine
          key = 0 ; t = 0
        end
        break if key == 81                  # break if we've reached the last value.
        t += 1 ; o += 1                     # add the reporting variables
      end
      Builder.new(sud)
    end

  end
end
