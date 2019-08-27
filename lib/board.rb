# frozen_string_literal: true

require_relative 'player.rb'
require_relative 'game.rb'

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
    result = Game.new(@grid)
    result.win_game
    @counter += 1
    [result.win_game, @counter, @grid]
  end
end
