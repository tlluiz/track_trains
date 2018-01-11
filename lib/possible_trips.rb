require 'track_finder'

class PossibleTrips
  attr_reader :start_point, :end_point, :min_stops, :max_stops, :track_finder, :trips, :trip_number

  def initialize(start_point:, end_point:, min_stops: 0, max_stops: 0, track_finder:)
    @start_point = start_point
    @end_point = end_point
    @min_stops = min_stops
    @max_stops = max_stops
    @track_finder = track_finder
  end

  def count_trips
    search
    correct_trips = trips.select { |_,trip| trip.last.end_point == end_point }
    correct_trips.size
  end

  def distance_of_trips
    search
    trips.select { |_,trip| trip.last.end_point == end_point }
         .map { |_,trip| trip }
         .sort { |x,y| x.sum(&:distance) <=> y.sum(&:distance) }
         .first
         .sum(&:distance)
  end

  private

  def search
    @trip_number = 1
    @trips = {}

    loop do
      break if  possible_start_tracks.size == 0
      track_around_the_way(possible_start_tracks)
      break if min_stops < max_stops
    end
  end

  def track_around_the_way(tracks)
    tracks.each do |track|
      trips[trip_number] = [track]
      loop do
        current_track = trips[trip_number].last
        current_track.increase_trip unless min_stops < max_stops
        next_track = possible_start_tracks(current_track.end_point).first

        break if next_track.nil?

        trips[trip_number].push(next_track)

        if min_stops < max_stops || min_stops == 0 || min_stops > max_stops
          break if lazy_stop_condition(trips[trip_number])
        else
          break if exactly_max_stops_condition(trips[trip_number])
        end
      end
      @trip_number += 1
    end
  end

  def exactly_max_stops_condition(trip)
    (trip.size == max_stops && trip.size >= min_stops) && trip.last.end_point == end_point
  end

  def lazy_stop_condition(trip)
    trip.last.end_point == end_point
  end

  def possible_start_tracks(point = nil)
    track_finder.find_by_point(point: point || start_point)
                .select { |track| track.trips < track.possible_trips }
  end
end
