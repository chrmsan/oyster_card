require_relative 'spec_helper'
require 'oystercard'

describe Oystercard do


  describe '#top_up' do
  
    it { is_expected.to respond_to(:top_up).with(1).argument }
    
    it 'should be able to add money to the card fi. 30' do
      expect{ subject.top_up(30) }.to change{ subject.balance }.by(30)
    end 

  end



  it "should have balance of 0 when initialized" do
    expect(subject.balance).to eq 0
  end

  it "should raise an error message when value added to card surpasses #{described_class::DEF_MAX_VAL}" do
    subject.top_up(described_class::DEF_MAX_VAL)
    expect { subject.top_up(1) }.to raise_error "Added money surpasses Oystercard limit of #{described_class::DEF_MAX_VAL} GBP"
  end


end
