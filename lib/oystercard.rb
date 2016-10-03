class Oystercard

  attr_reader :balance

  DEF_MAX_VAL = 90

    def initialize
      @balance = 0
    end 

    def top_up(value)
      fail 
      @balance += value
    end
end
