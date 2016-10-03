class Oystercard

  attr_reader :balance

  DEF_MAX_VAL = 90

    def initialize
      @balance = 0
    end 

    def top_up(value)
      fail "Added money surpasses Oystercard limit of #{DEF_MAX_VAL} GBP" if error_max(value)
      @balance += value
    end


  private

    def error_max(value)
      (@balance + value) > DEF_MAX_VAL
    end

end
