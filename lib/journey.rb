require_relative 'start_end'

class Journey

  include StartEnd

  attr_reader :in_journey, :entry_station, :exit_station

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def reset
     @entry_station = nil
     @exit_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  def nil_stations?
    @entry_station == nil || @exit_station == nil
  end

  def zone_difference
    (@entry_station.zone - @exit_station.zone).abs
  end
  
end
