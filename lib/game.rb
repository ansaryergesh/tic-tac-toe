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
    @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
  end

  def right_diagonal
    @grid[2][0] == @grid[1][1] && @grid[1][1] == @grid[0][2]
  end

  # Verticals
  def vertical
    vertical_one || vertical_two || vertical_three
  end

  def vertical_one
    @grid[0][0] == @grid[1][0] && @grid[1][0] == @grid[2][0]
  end

  def vertical_two
    @grid[0][1] == @grid[1][1] && @grid[1][1] == @grid[2][1]
  end

  def vertical_three
    @grid[0][2] == @grid[1][2] && @grid[1][2] == @grid[2][2]
  end

  # Horizontals
  def horizontal
    horizontal_one || horizontal_two || horizontal_three
  end

  def horizontal_one
    @grid[0][0] == @grid[0][1] && @grid[0][1] == @grid[0][2]
  end

  def horizontal_two
    @grid[1][0] == @grid[1][1] && @grid[1][1] == @grid[1][2]
  end

  def horizontal_three
    @grid[2][0] == @grid[2][1] && @grid[2][1] == @grid[2][2]
  end
end
