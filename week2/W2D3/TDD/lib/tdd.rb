#TDD exercises
require "byebug"

class Array
  def my_uniq
    results = []

    self.each do |ele|
      results << ele unless results.include?(ele)
    end

    results
  end

  def two_sum
    results = []

    (0...self.length).each do |i|
      ((i + 1)...self.length).each do |j|
        results << [i, j] if self[i] + self[j] == 0
      end
    end

    results
  end

  def my_transpose
    return self if self[0].length == 1
    result = Array.new(length) { Array.new(length) }

    (0...length).each do |i|
      (0...length).each do |j|
          result[i][j] = self[j][i]
       end
    end

    result
  end
end

def stock_picker(stock_prices)
  return nil if stock_prices.length <= 1
  max_profit = 0
  max_profit_indices = []

  (0...stock_prices.length).each do |i|
    ((i + 1)...stock_prices.length).each do |j|
      profit = stock_prices[j] - stock_prices[i]
      if profit > max_profit
        max_profit = profit
        max_profit_indices = [i, j]
      end
    end
  end

  max_profit_indices
end

class TowersOfHanoi

  attr_accessor :towers

  def initialize
    @towers = Array.new(3) { Array.new }
    towers[0] = [1, 2, 3]
  end

  def move(start_pos, end_pos)
    raise "starting tower empty" if towers[start_pos].empty?

    unless towers[end_pos].first.nil?
      if towers[end_pos].first < towers[start_pos].first
        raise "can't move a larger disc on to a smaller disc"
      end
    end

    towers[end_pos].unshift(towers[start_pos].shift)
  end

  def won?
      return true if towers[1].length == 3 || towers[2].length == 3
      false
  end

end
