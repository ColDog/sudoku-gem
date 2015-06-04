module Sudoku
  class Sudoku
    # this method builds the 'c,r,g' arguments which are used as local variables within
    # the main solve method to easily check whether a value is part of a row, column or
    # grid. This is done by getting the keys of each item with matching row coordinates,
    # column coordinates and grid coordinates, and adding all the values of each key to
    # the c,r,g.
    def build_crg(key,c,r,g)
      @coord.select { |k,v| v[0] == @coord[key][0] }.keys.each { |k| c << @sud[k] }
      @coord.select { |k,v| v[1] == @coord[key][1] }.keys.each { |k| r << @sud[k] }
      @coord.select { |k,v| v[2] == @coord[key][2] }.keys.each { |k| g << @sud[k] }
    end

    def check?(val,c,r,g)
      !c.flatten.include?(val) && !r.flatten.include?(val) && !g.flatten.include?(val)
    end
  end
end