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
      expect(@bike_club.most_rides).to eq(["Kenny", 4])
    end
  end

end


## Iteration 3 - Bike Club

# Use TDD to create a `BikeClub` class that adds the following functionality:

# 1. Each `BikeClub` has a name, as well as a way to read that data
# 1. Each `BikeClub` has a list of Bikers, and the `BikeClub` can add new Bikers.

# Additionally, use TDD to add the following functionality to the `BikeClub` class. 
# A passing challenge will complete at least one of the following. 
# We recommend completing more than one if you have time.

# 1. A `BikeClub` can tell us which Biker has logged the most rides.
# 1. A `BikeClub` can tell us which Biker has the best time for a given Ride.
# 1. A `BikeClub` can tell us which Bikers are eligible for a given Ride. 
#     A Biker is eligible for a Ride if the terrain is acceptable to them and 
#     the total distance does not exceed their max distance.

# | Method Name | Return Value |
# | ----------- | ------------ |
# | `name` | Club name as a `String` |
# | `bikers` | `Array` of `Biker` objects |
# | `add_biker(biker)` | `Array` of `Biker` objects |
# | `most_rides` | `Biker` object |
# | `best_time(ride)` | `Biker` object |
# | `bikers_eligible(ride)` | `Array` of `Biker` objects |