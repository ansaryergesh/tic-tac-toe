# frozen_string_literal: true

# Class Board
class Board
  attr_accessor :grid, :counter
  def initialize(grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    @counter = 0
    @grid = grid
  end

  def move(piece, place)
    if place <= 3
      @grid[0][@grid[0].index(place)] = piece
    elsif place <= 6
      @grid[1][@grid[1].index(place)] = piece
    else
      @grid[2][@grid[2].index(place)] = piece
    end
    result = Win.new(@grid)
    result.win_game
    @counter += 1
    [result.win_game, @counter, @grid]
  end
end

# win class methods when the game win some player
class Win
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def win_game
    if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2] ||
       @grid[2][0] == @grid[1][1] && @grid[1][1] == @grid[0][2] ||
       @grid[0][0] == @grid[1][0] && @grid[1][0] == @grid[2][0] ||
       @grid[0][1] == @grid[1][1] && @grid[1][1] == @grid[2][1] ||
       @grid[0][2] == @grid[1][2] && @grid[1][2] == @grid[2][2] ||
       @grid[0][0] == @grid[0][1] && @grid[0][1] == @grid[0][2] ||
       @grid[1][0] == @grid[1][1] && @grid[1][1] == @grid[1][2] ||
       @grid[2][0] == @grid[2][1] && @grid[2][1] == @grid[2][2]
      return true
    end

    false
  end
end
