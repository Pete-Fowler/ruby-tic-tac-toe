require_relative '../lib/tic_tac_toe'

RSpec.describe Game do
  describe "Game class #initialize" do
    it "creates an array of 9 1 space strings and has an @board attr" do
      game = Game.new
      expect(game.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])        
    end
  end
end