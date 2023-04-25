require './lib/bike_club'
require './lib/ride'
require './lib/biker'

RSpec.describe BikeClub do
  before(:each) do
    
  end

  describe 'initialize' do
    it 'has variables' do
      
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