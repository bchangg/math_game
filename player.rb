# frozen_string_literal: true

class Player
  attr_accessor :name, :lives, :turn, :answer

  def initialize(n)
    @name = n
    @lives = 3
    @turn = false
    @answer = 0
  end

  def solve(first, second, operator, stupid = [true, false].sample)
    first = first.to_i
    second = second.to_i

    if @turn
      case operator
      when 'plus'
        @answer = first + second
      when 'minus'
        @answer = first - second
      when 'multiply'
        @answer = first * second
      when 'divide'
        @answer = first / second
      else
        return "What? I don't understand this math operator"
      end
      return @answer += [1, 2, 3, -1, -2, -3].sample if stupid
    end
  end
end
