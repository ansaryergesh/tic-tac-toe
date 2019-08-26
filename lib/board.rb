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

def display(grid)
  puts '---------'
  puts "#{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]}"
  puts '---------'
  puts "#{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]}"
  puts '---------'
  puts "#{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]}"
  puts '---------'
end

def valid_name(name)
  loop do
    valid = name.empty?
    if valid
      puts 'Enter your name again please '
      name = gets.chomp
    else
      return name
    end
  end
end

def valid_piece(piece)
  loop do
    arr = %w[X O]
    return piece if arr.include? piece

    puts 'Enter a piece again! It should be x or o'
    piece = gets.chomp.upcase!
  end
end

def players_info
  name = gets.chomp
  player1 = Player.new(valid_name(name))
  puts 'X or O'
  piece = gets.chomp.upcase!
  player1.piece = valid_piece(piece)
  name = gets.chomp
  player2 = Player.new(valid_name(name))
  player2.piece = player1.piece == 'X' ? 'O' : 'X'
  [player1, player2]
end
