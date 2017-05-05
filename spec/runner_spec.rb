require 'spec_helper'
require './lib/runner'

describe Runner do

  it "prompts for and gets the next move" do
    fake_stdin("l") do
      expect(Runner.get_next_move).to eq("L")
    end
  end

  it "returns false if the input is invalid" do
    fake_stdin("k") do
      expect(Runner.get_next_move).to eq(false)
    end
  end

  it "returns if out of bounds" do
    expect(Runner.valid_move?([0,5], "U")).to be false
  end

  it "prints the board" do
    board = [[".........."],
             [".........."],
             ["..<......."],
             [".........."]]
    printed_board = <<EOF
..........
..........
..<.......
..........
EOF
    expect(STDOUT).to receive(:puts).with(board) { printed_board }
    Runner.print_board(board)
  end
end
