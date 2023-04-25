require './lib/bike_club'
require './lib/ride'
require './lib/biker'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club = BikeClub.new("Cycle Club")

    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)

    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)
    @biker.log_ride(@ride2, 60.9)
    @biker.log_ride(@ride2, 61.6)

    @biker2.learn_terrain!(:gravel)
    @biker2.learn_terrain!(:hills)

    @biker2.log_ride(@ride2, 67.0)
    @biker2.log_ride(@ride1, 97.0)
  end

  describe 'initialize' do
    it 'has variables' do
      expect(@bike_club.name).to eq("Cycle Club")
      expect(@bike_club.bikers).to eq([])
    end
  end

  describe 'it can add bikers' do
    before(:each) do
      @bike_club.add_biker(@biker2)
      @bike_club.add_biker(@biker)
    end
    it 'can show list of bikers' do
      expect(@bike_club.bikers).to include(@biker, @biker2)
    end
    it 'can see who has the most rides' do
      expect(@bike_club.most_rides).to eq([@biker, 4])
      # expect(@bike_club.most_rides).to eq(["Kenny", 4])
    end
    it 'can show best time on a ride' do
      expect(@bike_club.best_time(@ride2)).to eq([@biker, 60.9])
      # expect(@bike_club.best_time(@ride2)).to eq(["Kenny", 60.9])
    end
    it 'can show eligible bikers' do
      expect(@bike_club.bikers_eligible(@ride1)).to include(@biker)
      expect(@bike_club.bikers_eligible(@ride2)).to include(@biker, @biker2)
    end
  end

end