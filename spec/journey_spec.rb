require 'journey'

describe Journey do

	let(:station) { double(:station, :name => :station1, :zone => 1)}
	
	describe '#intialize' do

		it 'sets an entry_station variable' do
			subject = described_class.new(station,station)
			expect(subject.entry_station).to eq station
		end

		it 'sets an exit_station variable' do
			subject = described_class.new(station,station)
			expect(subject.exit_station).to eq station
		end
	end

	describe '#fare' do

		it 'returns 6 if no entry_station or exit_station' do
			subject = described_class.new(station)
			expect(subject.fare).to eq 6
		end

	end

end