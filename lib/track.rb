Track = Struct.new(:start_point, :end_point, :distance, :possible_trips, :trips) do

  def initialize(start_point:, end_point:, distance:, possible_trips: 0, trips: 0)
    self.start_point = start_point
    self.end_point = end_point
    self.distance = distance
    self.possible_trips = possible_trips
    self.trips = trips
  end

  def increase_trip
    self.trips += 1
  end
end
