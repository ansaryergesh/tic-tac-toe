# frozen_string_literal: true

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
    if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
      return true
    end

    false
  end
  
  def right_diagonal
    if @grid[2][0] == @grid[1][1] && @grid[1][1] == @grid[0][2]
      return true
    end

    false
  end

  # Verticals
  def vertical
    vertical_one || vertical_two || vertical_three
  end

  def vertical_one
    if @grid[0][0] == @grid[1][0] && @grid[1][0] == @grid[2][0]
      return true
    end
    
    false
  end

  def vertical_two
    if @grid[0][1] == @grid[1][1] && @grid[1][1] == @grid[2][1]
      return true
    end

    false
  end

  def vertical_three
    if @grid[0][2] == @grid[1][2] && @grid[1][2] == @grid[2][2]
      return true
    end

    false
  end

  # Horizontals
  def horizontal
    horizontal_one || horizontal_two || horizontal_three
  end

  def horizontal_one
    if @grid[0][0] == @grid[0][1] && @grid[0][1] == @grid[0][2] 
      return true
    end

    false
  end

  def horizontal_two
    if @grid[1][0] == @grid[1][1] && @grid[1][1] == @grid[1][2]
      return true
    end

    false
  end

  def horizontal_three
    if @grid[2][0] == @grid[2][1] && @grid[2][1] == @grid[2][2]
      return true
    end

    false
  end
end
