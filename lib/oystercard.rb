require_relative 'station'

class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :journeys

  DEF_MAX_VAL = 90
  DEF_MIN_FARE = 1

    def initialize
      @balance = 0
      @entry_station = nil
      @journeys = {}
    end 

    def top_up(value)
      fail "Added money surpasses Oystercard limit of #{DEF_MAX_VAL} GBP" if error_max(value)
      @balance += value
    end

    def in_journey
      !!@entry_station
    end

    def touch_in(station)
      fail "Insufficient balance to touch in" if min_balance
      @entry_station = station
    end

    def touch_out
      deduct(DEF_MIN_FARE)
      @entry_station = nil
    end


  private

    def error_max(value)
      (@balance + value) > DEF_MAX_VAL
    end

    def min_balance
      @balance < DEF_MIN_FARE
    end

    def deduct(fare)
      @balance -= fare
    end

end
