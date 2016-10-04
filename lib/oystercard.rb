class Oystercard

  attr_reader :balance, :max_limit, :in_journey, :entry_station

  DEF_MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize(limit=DEF_MAX_LIMIT)
    @balance = 0
    @max_limit = limit
    @in_journey = false
    @entry_station = nil
  end

  def top_up(value)
    fail "Can't top up to more than #{@max_limit} GBP" if exceeds_limit?(value)
    @balance += value 
  end

  def touch_in(station)
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  def in_journey?
    @in_journey
  end

  private

  def no_money?(fare)
    @balance <= MIN_FARE
  end

  def deduct(fare)
    fail "You do not have enough money on your Oystercard" if no_money?(fare) 
    @balance -= fare
  end

  def exceeds_limit?(value)
    (@balance + value) > @max_limit
  end
end
