# frozen_string_literal: true

require './game'

game = Game.new

puts 'Welcome to a 2 player Object Oriented Math Game!'

print 'Enter name for Player 1: '
result = gets.chomp.to_s
p1 = Player.new(result)

print 'Enter name for Player 2: '
result = gets.chomp.to_s
p2 = Player.new(result)

puts "\n------ START ------"
p1.turn = true

while p1.lives > 0 && p2.lives > 0
  game.print_lives(p1, p2)
  game.generate_question
  if p1.turn
    game.print_question(p1)
    p1.solve(game.first, game.second, game.operator)
    game.result(p1)
    p1.turn = false
    p2.turn = true
  else
    game.print_question(p2)
    p2.solve(game.first, game.second, game.operator)
    game.result(p2)
    p2.turn = false
    p1.turn = true
  end
  game.print_lives(p1, p2)
  game.new_turn
end
