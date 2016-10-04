require 'station'

describe Station do

  describe '#initialize' do
    
    it "checks the name of the station" do
      expect(described_class.new(:Piccadilly, 1).name).to be_a(Symbol)
    end

    it "checks the zone of the station" do
      expect(described_class.new(:Piccadilly, 1).zone).to be_a(Fixnum)
    end
  
  end

end