require './lib/runner'
require './lib/pacman'

class Play
  attr_accessor :coordinates, :board
  def initialize
    blank_board  = Pacman.board
    @coordinates = [1,5]
    @board       = Pacman.place_pacman(blank_board, @coordinates)
  end

  def tick
    Runner.print_board(@board)
    direction    = Runner.prompt_for_move
    if next_coords = Runner.valid_move?(@coordinates, direction)
      marker       = get_marker(direction)
      clear_path   = Pacman.place_pacman(@board, @coordinates, " ")
      new_board    = Pacman.place_pacman(clear_path, next_coords, marker)
      @board       = new_board
      @coordinates = next_coords
    else
      puts "Not a valid move. Choose a different direction"
      tick
    end
  end

  def game_over?
    !@board.flatten.join.strip.include?(".")
  end

  def get_marker(direction)
    case direction
    when "L"
      return Pacman::PACMAN_LEFT
    when "R"
      return Pacman::PACMAN_RIGHT
    when "D"
      return Pacman::PACMAN_DOWN
    when "U"
      return Pacman::PACMAN_UP
    end
  end
end
