class Game 
  attr_reader :board, :WIN_COMBOS

  WIN_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]
    
  def initialize 
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end
end
