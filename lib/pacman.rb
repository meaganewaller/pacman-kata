class Pacman
  PACMAN_DOWN = "∨"
  PACMAN_UP = "∧"
  PACMAN_LEFT = ">"
  PACMAN_RIGHT = "<"

  def self.board
    board = []
    4.times do |i|
      board << ["." * 10]
    end

    board
  end

  def self.place_pacman(board, placement=[], marker=Pacman::PACMAN_DOWN)
    row = placement[0]
    col = placement[1]
    board[row][0][col] = marker
    board
  end

  def self.next_coordinates(previous_coordinates, direction)
    initial_row = previous_coordinates[0]
    initial_col = previous_coordinates[1]

    if direction == "R"
      return [initial_row, initial_col + 1]
    elsif direction == "L"
      return [initial_row, initial_col - 1]
    elsif direction == "U"
      return [initial_row - 1, initial_col]
    elsif direction == "D"
      return [initial_row + 1, initial_col]
    end
  end

end
