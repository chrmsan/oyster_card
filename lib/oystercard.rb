require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :entry_station, :journey_log
  attr_accessor :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6


  def initialize(balance = 0, journey = Journey.new, journey_log = JourneyLog.new  )
    @balance = balance
    @journey = journey
    @journey_log = journey_log
  end

  def top_up(amount)
    fail "Maximum balance exceeded. Maximum balance allowed is #{MAXIMUM_BALANCE}" if balance_exceeded?(amount)
    @balance += amount
  end


  def touch_in(station)
    fail "Insufficient funds to travel" if insufficient_funds?
    journey.in_journey? == true ? deduct(fare) : start_journey(station)
  end

  def touch_out(station)
    finish_journey(station)
    deduct(fare)
    journey.reset
    journey_log.record
  end

private

  def start_journey(station)
    journey.start(station)
    journey_log.start(station)
  end

  def finish_journey(station)
    journey.end(station)
    journey_log.end(station)
  end

  def deduct(amount)
    @balance -= amount
  end

  def fare
    journey.nil_stations? ? PENALTY_FARE : calc_zone_fare
  end

  def calc_zone_fare
    MINIMUM_FARE + (journey.zone_difference)
  end

  def balance_exceeded?(amount)
    amount > (MAXIMUM_BALANCE - balance)
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end
end
