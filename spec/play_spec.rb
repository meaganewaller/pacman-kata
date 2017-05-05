require 'spec_helper'
require './lib/play'

describe Play do
  it "setting up the game" do
    game = Play.new
    expect(game.board).to eql Pacman.place_pacman(Pacman.board, [1,5])
  end

  it "plays the game" do
    game = Play.new
    fake_stdin("U") do
      marker = Pacman::PACMAN_UP
      board = [[".....#{marker}...."],
               ["..... ...."],
               [".........."],
               [".........."]]
      expect(STDOUT).to receive(:puts).with(game.board)
      expect(STDOUT).to receive(:puts).with("where to next? (L,D,U,R): ")

      game.tick
      expect(game.board).to eql(board)
      expect(game.coordinates).to eql([0,5])
    end
  end
end
