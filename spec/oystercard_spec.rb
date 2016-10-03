require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "has a starting balance of 0" do
    expect(subject.balance).to eq 0
  end 

  it "can be topped-up" do
    value = rand(1000)
    subject.top_up(value)
    expect(subject.balance).to eq value
  end
end
