require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "has a starting balance of 0" do
    expect(subject.balance).to eq 0
  end 

  it "can be topped-up" do
    value = 90
    subject.top_up(value)
    expect(subject.balance).to eq value
  end
end
describe Oystercard do
  it "has a max limit of 90" do
    expect{ subject.top_up(100) }.to raise_error("Can't top up to more than 90 GBP")
  end
end
