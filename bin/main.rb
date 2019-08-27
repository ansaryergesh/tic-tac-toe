# frozen_string_literal: true

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

puts 'Welcome to tic-tac-toe'
puts 'Tic-tac-toe is a fun game that you can play any time and anywhere. But we create that game for you in Ruby. So, you can play it by using terminal'
puts 'Instructions: We Have a 3*3 box'
puts 'A player has to input a number between 1 to 9'
puts 'Once input, it will display in its appropriate box with letters either X or O'
puts 'Keep alternating moves until one of the players has drawn a row of three symbols or until no one can win.'
print "\n\n"

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
    return name unless valid
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
  puts 'Name of 1st Player: '
  name = gets.chomp
  player1 = Player.new(valid_name(name))
  puts "Please select there some symbol 'x' or 'o'"
  piece = gets.chomp.upcase!
  player1.piece = valid_piece(piece)
  puts 'Please enter 2nd Player name'
  name = gets.chomp
  player2 = Player.new(valid_name(name))
  player2.piece = player1.piece == 'X' ? 'O' : 'X'
  [player1, player2]
end

players = players_info
player1 = players[0]
player2 = players[1]

loop do
  board = Board.new
  grid = board.grid
  display(grid)

  loop do
    begin
        puts '1st Player: choose number between 1-9'
        place = gets.chomp
        result = board.move(player1.piece, place.to_i)
        display(result[2])
    rescue StandardError
      puts "Error,You cannot use this place ! \n Try again :)"
      retry
      end
    if result[0] == true
      puts "#{player1.name} wins"
      player1.amount += 1
      puts "#{player1.name} amount is: #{player1.amount}"
      puts "#{player2.name} amount is: #{player2.amount}"
      break
    end
    if result[1] == 9
      puts 'Draw'
      puts "#{player1.name} amount is: #{player1.amount}"
      puts "#{player2.name} amount is: #{player2.amount}"
      break
    end

    begin
      puts '2nd Player :Choose a place between 1 and 9'
      place = gets.chomp
      result = board.move(player2.piece, place.to_i)
      display(result[2])
    rescue StandardError
      puts "Error,You cannot use this place ! \n Try again :)"
      retry
    end

    next unless result[0] == true

    puts "#{player2.name} win"
    player2.amount += 1
    puts "#{player1.name} amount is: #{player1.amount}"
    puts "#{player2.name} amount is: #{player2.amount}"
    break
  end

  play_again = 'n'

  sleep 0.5
  puts 'GAME OVER'
  sleep 0.5
  # play again? if yes write 'y' if no write 'n'
  puts 'Play again? (y/n)'
  break if gets.chomp == play_again
end

# play again?
