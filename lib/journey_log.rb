require_relative 'journey'

class JourneyLog

  attr_reader :journey_history, :entry_station, :exit_station

  def initialize(entry_station = nil, exit_station = nil)
    @journey_history = []
    @entry_station = entry_station
    @exit_station = exit_station
  end


#
  def start(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
  end

  def reset_journey
     @entry_station = nil
     @exit_station = nil
  end

  def record_journey
    journey_history << {in: @entry_station, out: @exit_station}
    reset_journey
  end
#

end
