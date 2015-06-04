require File.expand_path(File.join(File.dirname(__FILE__), 'sudoku'))

module SudokuBuilder
  class Builder < Sudoku
    def initialize(sudoku)
      @sud = sudoku
    end

    def parse
      @sud.each do |k,v|
        if v.class == Array && v[0] == nil
          @sud[k] = []
        elsif v.class == Array && v[0] != nil
          @sud[k] = v[0]
        else
          @sud[k] = v
        end
      end
      @sud
    end

    def to_hash
      @sud.each do |k,v|
        @sud[k] = v[0] if v.class == Array
      end
      @sud
    end

    # pokes holes in a built sudoku to make it solvable.
    # arranged by level of difficulty.
    def poke(number, poke_with = [])
      @sud.to_hash
      poke = []
      until poke.count == number            # number is related to difficulty.
        poke << rand(0..80)                 # 0 - 80 refers to the index of the sudoku cells.
        poke = poke.uniq
      end
      poke.each do |p|                      # pokes random holes.
        @sud[p] = poke_with
      end
      Builder.new(@sud)
    end

    # checks if a sudoku is valid.
    def valid?
      valid = []
      @sud.each do |k,v|
        c = [] ; r = [] ; g = []
        build_crg(k,c,r,g,@sud)
        v.class == Array ? val = v[0] : val = v
        if check?(val, c,r,g)              # runs the check method used before on every value.
          valid << false
        else
          valid << true
        end
      end
      !valid.include?(false)
    end

    def medium(poke_with = [])
      self.poke(45, poke_with)
    end

    def easy(poke_with = [])
      self.poke(55, poke_with)
    end

    def hard(poke_with = [])
      self.poke(65, poke_with)
    end

    def pretty_print
      b = self.to_hash
      puts "+-----------------------------+"
      puts "| #{b[0]}  #{b[1]}  #{b[2]} | #{b[3]}  #{b[4]}  #{b[5]} | #{b[6]}  #{b[7]}  #{b[8]} |"
      puts "| #{b[9]}  #{b[10]}  #{b[11]} | #{b[12]}  #{b[13]}  #{b[14]} | #{b[15]}  #{b[16]}  #{b[17]} |"
      puts "| #{b[18]}  #{b[19]}  #{b[20]} | #{b[21]}  #{b[22]}  #{b[23]} | #{b[24]}  #{b[25]}  #{b[26]} |"
      puts "+-----------------------------+"
      puts "| #{b[27]}  #{b[28]}  #{b[29]} | #{b[30]}  #{b[31]}  #{b[32]} | #{b[33]}  #{b[34]}  #{b[35]} |"
      puts "| #{b[36]}  #{b[37]}  #{b[38]} | #{b[39]}  #{b[40]}  #{b[41]} | #{b[42]}  #{b[43]}  #{b[44]} |"
      puts "| #{b[45]}  #{b[46]}  #{b[47]} | #{b[48]}  #{b[49]}  #{b[50]} | #{b[51]}  #{b[52]}  #{b[53]} |"
      puts "+-----------------------------+"
      puts "| #{b[54]}  #{b[55]}  #{b[56]} | #{b[57]}  #{b[58]}  #{b[59]} | #{b[60]}  #{b[61]}  #{b[62]} |"
      puts "| #{b[63]}  #{b[64]}  #{b[65]} | #{b[66]}  #{b[67]}  #{b[68]} | #{b[69]}  #{b[70]}  #{b[71]} |"
      puts "| #{b[72]}  #{b[73]}  #{b[74]} | #{b[75]}  #{b[76]}  #{b[77]} | #{b[78]}  #{b[79]}  #{b[80]} |"
      puts "+-----------------------------+"
    end

  end
end