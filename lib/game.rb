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

  def diagonal
    if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2] ||
       @grid[2][0] == @grid[1][1] && @grid[1][1] == @grid[0][2]
      return true
    end

    false
  end

  def vertical
    if @grid[0][0] == @grid[1][0] && @grid[1][0] == @grid[2][0] ||
       @grid[0][1] == @grid[1][1] && @grid[1][1] == @grid[2][1] ||
       @grid[0][2] == @grid[1][2] && @grid[1][2] == @grid[2][2]
      return true
    end

    false
  end

  def horizontal
    if @grid[0][0] == @grid[0][1] && @grid[0][1] == @grid[0][2] ||
       @grid[1][0] == @grid[1][1] && @grid[1][1] == @grid[1][2] ||
       @grid[2][0] == @grid[2][1] && @grid[2][1] == @grid[2][2]
      return true
    end

    false
  end
end