class Runner
  def self.print_board(board)
    puts board
  end

  def self.prompt_for_move
    puts "where to next? (L,D,U,R): "
    dir = Runner.get_next_move
    if dir
      return dir
    else
      Runner.prompt_for_move
    end
  end

  def self.get_next_move
    direction = gets.chomp.strip.upcase
    return false unless ["L", "D", "U", "R"].include?(direction)
    direction
  end

  def self.valid_move?(current_coords, direction)
    next_coords = Pacman.next_coordinates(current_coords, direction)
    if next_coords[0] < 0 || next_coords[1] < 0
      return false
    elsif next_coords[0] > 3 || next_coords[1] > 9
      return false
    else
      return next_coords
    end
  end

end
