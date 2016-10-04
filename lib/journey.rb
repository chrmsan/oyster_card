class Journey
	attr_reader :entry_station, :exit_station
	def initialize(entry_station=nil,exit_station=nil)
		@entry_station = entry_station
		@exit_station = exit_station
	end	

	def fare
		any_nil_stations? ? 6 : 1 
	end

	private

	def any_nil_stations?
		@entry_station == nil or @exit_station == nil
	end
end