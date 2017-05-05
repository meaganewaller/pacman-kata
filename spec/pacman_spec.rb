require 'spec_helper'
require './lib/pacman'

describe Pacman do
  it "there is a board" do
    board = [[".........."],
             [".........."],
             [".........."],
             [".........."]]
    expect(Pacman.board).to eq(board)
  end

  context "placing pacman on the board" do
    let(:board) { Pacman.board }

    it "places pacman on the board facing up initially" do
      pacman_on_board = Pacman.place_pacman(board, [1,1])

      expect(pacman_on_board).to eql([[".........."],
                                      [".#{Pacman::PACMAN_DOWN}........"],
                                      [".........."],
                                      [".........."]])
    end

    it "places pacman on the board facing down" do
      pacman_on_board = Pacman.place_pacman(board, [1,1], Pacman::PACMAN_UP)
      expect(pacman_on_board).to eql([[".........."],
                                      [".#{Pacman::PACMAN_UP}........"],
                                      [".........."],
                                      [".........."]])
    end
  end

  context "getting next coordinates" do

    it "moves pacman to the right" do
      next_coordinates = Pacman.next_coordinates([2,6], "R")

      expect(next_coordinates).to eql([2,7])
    end

    it "moves pacman to the left" do
      next_coordinates = Pacman.next_coordinates([2,6], "L")

      expect(next_coordinates).to eql([2,5])
    end

    it "moves pacman up" do
      next_coordinates = Pacman.next_coordinates([2,6], "U")
      expect(next_coordinates).to eql([1, 6])
    end

    it "moves pacman down" do
      next_coordinates = Pacman.next_coordinates([2,6], "D")
      expect(next_coordinates).to eql([3,6])
    end
  end

end
