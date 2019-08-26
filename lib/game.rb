# frozen_string_literal: true

# Class Game
class Game
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def win_game
    diagonal || vertical || horizontal
  end

  # private methods
  private

  # Diagonals
  def diagonal
    left_diagonal || right_diagonal
  end

  def left_diagonal
    return true if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]

    false
  end

  def right_diagonal
    return true if @grid[2][0] == @grid[1][1] && @grid[1][1] == @grid[0][2]

    false
  end

  # Verticals
  def vertical
    vertical_one || vertical_two || vertical_three
  end

  def vertical_one
    return true if @grid[0][0] == @grid[1][0] && @grid[1][0] == @grid[2][0]

    false
  end

  def vertical_two
    return true if @grid[0][1] == @grid[1][1] && @grid[1][1] == @grid[2][1]

    false
  end

  def vertical_three
    return true if @grid[0][2] == @grid[1][2] && @grid[1][2] == @grid[2][2]

    false
  end

  # Horizontals
  def horizontal
    horizontal_one || horizontal_two || horizontal_three
  end

  def horizontal_one
    return true if @grid[0][0] == @grid[0][1] && @grid[0][1] == @grid[0][2]

    false
  end

  def horizontal_two
    return true if @grid[1][0] == @grid[1][1] && @grid[1][1] == @grid[1][2]

    false
  end

  def horizontal_three
    return true if @grid[2][0] == @grid[2][1] && @grid[2][1] == @grid[2][2]

    false
  end
end
