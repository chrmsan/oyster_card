require_relative 'spec_helper'
require 'oystercard'

describe Oystercard do



  it "should have balance of 0 when initialized" do
    expect(subject.balance).to eq 0
  end



  describe '#top_up' do
  
    it { is_expected.to respond_to(:top_up).with(1).argument }
    
    it 'should be able to add money to the card fi. 30' do
      expect { subject.top_up(30) }.to change{ subject.balance }.by(30)
    end 

    it "should raise an error message when value added to card surpasses default maximum value" do
      max_val = described_class::DEF_MAX_VAL
      subject.top_up(max_val)
      expect { subject.top_up(1) }.to raise_error "Added money surpasses Oystercard limit of #{max_val} GBP"
    end

  end



  # describe '#deduct' do      NO LONGER RELEVANT SINCE METHOD IS IN PRIVATE

  #   it { is_expected.to respond_to(:deduct).with(1).argument }

  #   it 'should be able to deduct min_fare price from card' do
  #     min_fare = described_class::DEF_MIN_FARE
  #     subject.top_up(described_class::DEF_MAX_VAL)
  #     expect { subject.deduct(min_fare) }.to change { subject.balance }.by(-min_fare)
  #   end

  # end



  describe '#in_journey' do

    it { is_expected.to respond_to(:in_journey) }
    
    it { is_expected.to respond_to(:touch_in) }

    it { is_expected.to respond_to(:touch_out) }





    it 'should default in_journey initialize with false and before touch_in to check that card is not in use' do
      expect { subject.in_journey.to be_false }
    end

    it 'should change in_travel from false to true when using touch_in' do
      subject.top_up(described_class::DEF_MAX_VAL)
      subject.touch_in
      expect { subject.in_journey.to be_true }
    end

    it 'should change in_travel from true to false when using touch_out' do
      subject.top_up(described_class::DEF_MAX_VAL)  
      subject.touch_in
      subject.touch_out
      expect { subject.in_journey.to be_false }
    end

    context 'when there is no money in the card' do
      it 'will not touch_in if it is below the minimum fare' do
      expect { subject.touch_in }.to raise_error "Insufficient balance to touch in"
      end      
    end
  end



end
