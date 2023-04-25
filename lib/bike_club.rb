class BikeClub
attr_reader :name, :bikers
attr_accessor 

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    rides = {}
    @bikers.each do |biker|
      biker.rides.each do |ride, total|
        if rides.keys.include?(biker.name)
          rides[biker.name] << total.count
        else 
          rides[biker.name] = [total.count]
        end
      end
    end
    most = {}
      rides.each do |rider, rides|
        most[rider] = rides.sum
      end
      most.max
  end

  def best_time(ride)
    
  end

  def bikers_eligible(ride)
    
  end
end