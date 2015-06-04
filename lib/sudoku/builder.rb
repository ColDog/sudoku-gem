require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku'))

module Sudoku
  class Builder < Sudoku

    def initialize(sudoku)
      @sud = sudoku
    end

    # pokes holes in a built sudoku to make it solvable.
    # arranged by level of difficulty.
    def medium
      @sud.each { |k,v| @sud[k] = v[0] if v.class == Array  }
      poke = []
      until poke.count == 55                # number is related to difficulty.
        poke << rand(0..80)                 # 0 - 80 refers to the index of the sudoku cells.
        poke = poke.uniq
      end
      poke.each do |p|                      # pokes random holes.
        @sud[p] = '_'
      end
      @sud
    end

    # checks if a sudoku is valid.
    def valid
      valid = []
      @sud.each do |k,v|
        c = [] ; r = [] ; g = []
        build_crg(k, c,r,g)
        if check?(v[0], c,r,g)              # runs the check method used before on every value.
          valid << false
        else
          valid << true
        end
      end
      !valid.include?(false)
    end

  end
end