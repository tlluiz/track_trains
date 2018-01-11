require 'track'
require 'track_finder'

class TracksParser
  class << self
    def parse(string_tracks)
      string_tracks.map do |string_track|
        create_track(string_track)
      end
    end

    def update_possible_trips(tracks)
      track_finder = TrackFinder.new(tracks)
      tracks.map do |track|
        track.possible_trips = track_finder.find_by_point(point: track.end_point).size
        track
      end
    end

    private

    def create_track(string_track)
      splited_track = string_track.split(//)

      Track.new(
        start_point: splited_track[0],
        end_point: splited_track[1],
        distance: splited_track[2].to_i
      )
    end
  end
end
