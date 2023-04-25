require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new( {name: "Walnut Creek Trail", 
                        distance: 10.7, 
                        loop: false, 
                        terrain: :hills} )
    @ride2 = Ride.new( {name: "Town Lake", 
                        distance: 14.9, 
                        loop: true, 
                        terrain: :gravel} )
  end

  describe 'attributes' do
    it 'has a name' do
      expect(@ride1.name).to eq("Walnut Creek Trail")
    end
    it 'has a distance' do
      expect(@ride1.distance).to eq(10.7)
    end
    it 'has terrain' do
      expect(@ride1.terrain).to eq(:hills)
    end
    it 'has loop?' do
      expect(@ride1.loop?).to eq(false)
    end
    it 'has a longer distance if its not a loop' do
      expect(@ride1.total_distance).to eq(21.4)
    end
    it 'can have true for loop?' do
      expect(@ride2.loop?).to eq(true)
    end
    it 'has distance x1 for loop rides' do
      expect(@ride2.distance).to eq(14.9)
    end
  end
end
