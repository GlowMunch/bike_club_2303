class Biker
attr_reader :name, :max_distance, :rides, :acceptable_terrain
attr_accessor 

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, dist)
    if @acceptable_terrain.include?(ride.terrain) == false
      p "#{@name} dosen't know this terrain yet"
    elsif @max_distance < ride.total_distance
      p "#{@name} cant go this far yet"
    else
      if @rides.keys.include?(ride)
        @rides[ride] << dist
      else 
        @rides[ride] = [dist]
      end
      p "#{@name} can make this ride!"
    end
  end

  def personal_record(ride)
    pr = 0
    @rides.each do |key, values|
      if ride.name == key.name
        pr = values.min
      end
    end
    return pr if pr != 0
      false
  end

end