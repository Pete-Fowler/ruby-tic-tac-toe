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

  
end