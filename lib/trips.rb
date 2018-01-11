require 'track'
require 'route'
require 'track_finder'
require 'tracks_parser'
require 'routes_parser'
require 'possible_trips'

class Trips
  attr_reader :tracks, :routes, :track_finder

  def initialize(string_tracks)
    @tracks = TracksParser.parse(string_tracks)
    @track = TracksParser.update_possible_trips(@tracks)
    @track_finder = TrackFinder.new(@tracks)
  end

  def distance_of_the_route(string_routes)
    @routes = RoutesParser.parse(string_routes)

    distances = routes.map do |route|
      track_finder.find_by_route(route)&.distance
    end

    return 'NO SUCH ROUTE' if wrong_number_of(distances)
    distances.compact.sum
  end

  def time_of_the_route(string_routes)
    @routes = RoutesParser.parse(string_routes)

    times = routes.map do |route|
      track_finder.find_by_route(route).distance
    end

    string_routes.split('-').count < 3 ? times.sum : times.sum + (string_routes.split('-').count - 1)
  end

  def number_of_trips(start_point:, end_point:, max_stops:, min_stops: 1)
    possible_trips = PossibleTrips.new(
      start_point: start_point,
      end_point: end_point,
      min_stops: min_stops,
      max_stops: max_stops,
      track_finder: track_finder
    ).count_trips
  end

  def distance_of_shortest_trip(start_point: ,end_point:)
    stop = start_point == end_point ? 1 : 0
    possible_trips = PossibleTrips.new(
      start_point: start_point,
      end_point: end_point,
      track_finder: track_finder,
      min_stops: stop
    ).distance_of_trips
  end

  private

  def wrong_number_of(distances)
    distances.compact.size < routes.size
  end

  def possible_tracks(trips, round, index)
    tracks = track_finder.find_by_point(point: trips[round].last.end_point)
    return tracks if round == 0
    tracks.delete(trips.select { |_,v| v[index + 1]&.start_point == trips[round].last.start_point}.first)
    tracks
  end
end
