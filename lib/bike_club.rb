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
        if rides.keys.include?(biker)
          rides[biker] << total.count
        else 
          rides[biker] = [total.count]
        end
      end
    end
      most = {}
      rides.each do |rider, rides|
        most[rider] = rides.sum
      end
      most.sort_by { |key, value| value }.last
      #this returns the Biker object as key and the total number of rides as value
  end


  ### This is same as above bit returns string of rider name as key and total rides as value
  # def most_rides
  #   rides = {}
  #   @bikers.each do |biker|
  #     biker.rides.each do |ride, total|
  #       if rides.keys.include?(biker.name)
  #         rides[biker.name] << total.count
  #       else 
  #         rides[biker.name] = [total.count]
  #       end
  #     end
  #   end
  #   most = {}
  #     rides.each do |rider, rides|
  #       most[rider] = rides.sum
  #     end
  #     most.sort_by { |key, value| value }.last
  # end

  def best_time(ride)
    best_overall = {}
    @bikers.each do |biker|
      best_overall[biker] = biker.personal_record(ride)
    end
    best_overall.sort_by { |key, value| value }.first
    #this returns the Biker object as key and the best time as value
  end

### This is same as above bit returns string of rider name as key and best time as value
  # def best_time(ride)
  #   best_overall = {}
  #   @bikers.each do |biker|
  #     best_overall[biker.name] = biker.personal_record(ride)
  #   end
  #   best_overall.sort_by { |key, value| value }.first
  # end



  def bikers_eligible(ride)
    eligible = []
      @bikers.each do |biker|
        if biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance > ride.total_distance
          eligible << biker
        end
      end
      eligible
  end

end