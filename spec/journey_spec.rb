require 'spec_helper'

describe Journey do

  let(:card) {Oystercard.new(Oystercard::MINIMUM_FARE) { include StartEnd } }
  let(:station1) {double(:station1, :zone=>1) }
  let(:station2) {double(:station2, :zone=>1) }
  let(:station3) {double(:station3, :zone=>3) }

  describe '#in_journey?' do
    it 'verifies that users is NOT in a journey' do
      expect(card.journey.in_journey?).not_to be true
    end
  end

  it 'verifies that user is in journey after touching in' do
    card.touch_in(station1)
    expect(card.journey.in_journey?).to be true
  end


  it 'verifies that user is not in journey after touching out' do
    card.touch_in(station1)
    card.touch_out(station2)
    expect(card.journey.in_journey?).not_to be true
  end

  describe 'gets the start end end methods from StartEnd module' do
    before do
      card.touch_in(station1)
    end
    it 'will set the entry_station' do
      expect(card.journey.entry_station).to eq(station1)
    end
    it 'will set the exit_station' do
      card.touch_out(station2)
      expect(card.journey_log.exit_station).to eq(station2)
    end
  end

  describe '#reset' do
    before do
      card.touch_in(station1)
      card.touch_out(station2)
    end    

    it 'resets entry station to nil when journey is completed' do
      expect(card.journey.entry_station).to be nil
    end

    it 'resets exit station to nil when journey is completed' do
      expect(card.journey.exit_station).to be nil
    end

  end


end
