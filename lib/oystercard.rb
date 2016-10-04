class Oystercard

  attr_reader :balance, :max_limit, :in_journey 
  attr_accessor :journeys, :exit_station, :entry_station

  DEF_MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize(limit=DEF_MAX_LIMIT)
    @balance = 0
    @max_limit = limit
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(value)
    fail "Can't top up to more than #{@max_limit} GBP" if exceeds_limit?(value)
    @balance += value 
  end

  def touch_in(station)
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    log_journey
  end

  def in_journey?
    @entry_station == nil ? false : true 
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

  def log_journey
     @journeys << {:entry_station => @entry_station, :exit_station => @exit_station}
     clear_station 
  end

  def clear_station
    @entry_station = nil
    @exit_station = nil
  end

end
