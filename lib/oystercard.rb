class Oystercard

  attr_reader :balance, :in_journey

  DEF_MAX_VAL = 90
  DEF_MIN_FARE = 1

    def initialize
      @balance = 0
      @in_travel = false
    end 

    def top_up(value)
      fail "Added money surpasses Oystercard limit of #{DEF_MAX_VAL} GBP" if error_max(value)
      @balance += value
    end

    def deduct(fare)
      @balance -= fare
    end

    def in_journey
      @in_travel
    end

    def touch_in
      @in_travel = true
    end

    def touch_out
      @in_travel = false
    end


  private

    def error_max(value)
      (@balance + value) > DEF_MAX_VAL
    end

end
