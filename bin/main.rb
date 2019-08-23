
puts "Welcome to tic-tac-toe"
puts "Tic-tac-toe is a fun game that you can play any time and anywhere. But we create that game for you in Ruby. So, you can play it by using terminal"
puts "Instructions: We Have a 3*3 box"
puts "A player has to input a number between 1 to 9"
puts "Once input, it will display in its appropriate box with letters either X or O"
puts "Keep alternating moves until one of the players has drawn a row of three symbols or until no one can win."
print "\n\n"



# play again?
play_again = 'y'
 
while play_again == 'y'

sleep 0.5
puts "GAME OVER" 

# play again?
sleep 0.5
puts "Play again? (y/n)"
play_again = gets.chomp
end