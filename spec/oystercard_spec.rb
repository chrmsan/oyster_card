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

  it "has a max limit of 90" do
    expect{ subject.top_up(100) }.to raise_error("Can't top up to more than #{subject.max_limit} GBP")
  end

  it "deducts a fare from the card" do
    fare = 3
    subject.top_up(subject.max_limit)
    subject.deduct(fare)
    expect(subject.balance).to eq (subject.max_limit - fare)
  end

  it "throws an error when you do not have enough money" do
    expect{ subject.deduct(10) }.to raise_error("You do not have enough money on your Oystercard")
  end

  describe "#initialize" do

    it "defaults in_journey? to false" do
      expect(subject.in_journey?).to be_false
    end
  end

  it "changes in_journey to true on touch_in" do
    subject.touch_in
    expect(subject.in_journey?).to be_true
  end


  it "changes in_journey to false on touch_out" do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to be_false
  end

end
