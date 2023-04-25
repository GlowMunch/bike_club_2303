
require './lib/biker'
require './lib/ride'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

  end

  describe 'attributes' do
    it 'has a name' do
      expect(@biker.name).to eq("Kenny")
    end
    it 'has a max distance' do
      expect(@biker.max_distance).to eq(30)
    end
    it 'has rides hash' do
      expect(@biker.rides).to eq({})
    end
    it 'has acceptable terrain array' do
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe 'methods' do
    before(:each) do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
    end
    it 'can lean terrain' do
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
    it 'can log rides' do
      expect(@biker.rides).to include(@ride1, @ride2)
    end
    it 'can have a PR for a ride' do
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
    it 'can learn terrain but still not go distance' do
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      expect(@biker2.log_ride(@ride1, 97.0)).to eq("Athena cant go this far yet")
      expect(@biker2.log_ride(@ride2, 67.0)).to eq("Athena can make this ride!")
      expect(@biker2.personal_record(@ride2)).to eq(67.0)
      expect(@biker2.personal_record(@ride1)).to eq(false)
    end
  end
  
end
