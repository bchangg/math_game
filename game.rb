# frozen_string_literal: true

require './player'

class Game
  attr_accessor :first, :second, :operator

  def initialize
    @first = 0
    @second = 0
    @operator = 'plus'
  end

  def generate_question
    operator_picker = rand(0...3)
    self.first = rand(1...100)
    self.second = rand(1...100)
    case operator_picker
    when 0
      self.operator = 'plus'
    when 1
      self.operator = 'minus'
    when 2
      self.operator = 'times'
    when 3
      self.operator = 'divided by'
    end
  end

  def result(player)
    correct_answer = 0
    case @operator
    when 'plus'
      correct_answer = @first + @second
    when 'minus'
      correct_answer = @first - @second
    when 'times'
      correct_answer = @first * @second
    when 'divided by'
      correct_answer = @first / @second
    end
    if player.answer != correct_answer
      player.lives -= 1
      puts 'Seriously? No!'
    else
      puts 'YES! You are correct.'
    end
  end

  def print_question(player)
    puts "#{player.name}: What does #{@first} #{@operator} #{@second} equal?" if player.turn
  end

  def print_lives(p1, p2)
    puts "LIVES LEFT - #{p1.name}: #{p1.lives}/3 vs #{p2.name}: #{p2.lives}/3"
  end

  def new_turn
    puts '------ NEW TURN ------'
  end

  def game_over
    puts '------ GAME OVER ------'
  end

end
