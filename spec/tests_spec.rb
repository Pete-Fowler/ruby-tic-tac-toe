require_relative '../lib/tic_tac_toe'

describe Game do
  let(:game) { Game.new }

  describe "Game class #initialize" do
    it "creates an array of 9 1 space strings and has an @board attr" do
      expect(game.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])        
    end
  end

  describe "WIN_COMBOS" do 
    it "has a class constant of all win combos" do 
      expect(Game::WIN_COMBOS).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]])
    end
  end 

  describe "#print_board" do 
    it "prints current state of gameboard" do 
      game.board = ["O", "X", "O", "X", "O", "X", "O", "X", "O"]
      
      $stdout = StringIO.new
      game.print_board
      $stdout.rewind

      expect($stdout.gets).to eq(" O | X | O \n")
      expect($stdout.gets).to eq("-----------\n")
      expect($stdout.gets).to eq(" X | O | X \n")
      expect($stdout.gets).to eq("-----------\n")
      expect($stdout.gets).to eq(" O | X | O \n")
    end
  end

  describe "#input_to_index" do 
    it "takes player input and subtracts one for array index" do 
      expect(game.input_to_index(5)).to eq(4)
      expect(game.input_to_index(2)).to eq(1)
      expect(game.input_to_index(3)).not_to eq(3)
    end
  end 

  describe "#position_taken?" do 
    it "Returns true/false whether the position is taken" do 
      game.board = ["O", " ", "O", "X", "O", "X", "O", "X", "O"]

      expect(game.position_taken?(3)).to eq(true)
      expect(game.position_taken?(1)).to eq(false)
    end
  end

  describe "#valid_move?" do 
    it "Returns true if position not taken and move is on board" do 
      game.board = ["O", " ", "O", "X", "O", "X", "O", "X", "O"]

      expect(game.valid_move?(1)).to eq(true)
      expect(game.valid_move?(2)).to eq(false)
      expect(game.valid_move?(9)).to eq(false)
      expect(game.valid_move?(-1)).to eq(false)

    end 
  end 
end