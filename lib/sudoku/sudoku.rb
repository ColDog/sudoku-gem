module Sudoku
  class Sudoku

    # this method builds the 'c,r,g' arguments which are used as local variables within
    # the main solve method to easily check whether a value is part of a row, column or
    # grid. This is done by getting the keys of each item with matching row coordinates,
    # column coordinates and grid coordinates, and adding all the values of each key to
    # the c,r,g.
    def build_crg(key,c,r,g,sud)
      coord = {
        0=> [0,0,1], 1=> [1,0,1], 2=> [2,0,1], 3=> [3,0,4], 4=> [4,0,4], 5=> [5,0,4], 6=> [6,0,7], 7=> [7,0,7], 8=> [8,0,7],
        9=> [0,1,1], 10=>[1,1,1], 11=>[2,1,1], 12=>[3,1,4], 13=>[4,1,4], 14=>[5,1,4], 15=>[6,1,7], 16=>[7,1,7], 17=>[8,1,7],
        18=>[0,2,1], 19=>[1,2,1], 20=>[2,2,1], 21=>[3,2,4], 22=>[4,2,4], 23=>[5,2,4], 24=>[6,2,7], 25=>[7,2,7], 26=>[8,2,7],
        27=>[0,3,2], 28=>[1,3,2], 29=>[2,3,2], 30=>[3,3,5], 31=>[4,3,5], 32=>[5,3,5], 33=>[6,3,8], 34=>[7,3,8], 35=>[8,3,8],
        36=>[0,4,2], 37=>[1,4,2], 38=>[2,4,2], 39=>[3,4,5], 40=>[4,4,5], 41=>[5,4,5], 42=>[6,4,8], 43=>[7,4,8], 44=>[8,4,8],
        45=>[0,5,2], 46=>[1,5,2], 47=>[2,5,2], 48=>[3,5,5], 49=>[4,5,5], 50=>[5,5,5], 51=>[6,5,8], 52=>[7,5,8], 53=>[8,5,8],
        54=>[0,6,3], 55=>[1,6,3], 56=>[2,6,3], 57=>[3,6,6], 58=>[4,6,6], 59=>[5,6,6], 60=>[6,6,9], 61=>[7,6,9], 62=>[8,6,9],
        63=>[0,7,3], 64=>[1,7,3], 65=>[2,7,3], 66=>[3,7,6], 67=>[4,7,6], 68=>[5,7,6], 69=>[6,7,9], 70=>[7,7,9], 71=>[8,7,9],
        72=>[0,8,3], 73=>[1,8,3], 74=>[2,8,3], 75=>[3,8,6], 76=>[4,8,6], 77=>[5,8,6], 78=>[6,8,9], 79=>[7,8,9], 80=>[8,8,9]
      }
      coord.select { |k,v| v[0] == coord[key][0] }.keys.each { |k| c << sud[k] }
      coord.select { |k,v| v[1] == coord[key][1] }.keys.each { |k| r << sud[k] }
      coord.select { |k,v| v[2] == coord[key][2] }.keys.each { |k| g << sud[k] }
    end

    def check?(val,c,r,g)
      !c.flatten.include?(val) && !r.flatten.include?(val) && !g.flatten.include?(val)
    end
  end
end