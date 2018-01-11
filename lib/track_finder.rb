class TrackFinder
  attr_reader :tracks

  def initialize(tracks)
    @tracks = tracks
  end

  def find_by_route(route)
    tracks.select {|track| match_track(track, route) }.first
  end

  def find_by_point(point:, point_type: :start_point)
    tracks.select do |track|
      match_point(track: track, point: point, point_type: point_type)
    end
  end

  private

  def match_track(track, route)
    track.start_point == route.start_point && track.end_point == route.end_point
  end

  def match_point(track:, point:, point_type:)
    track.send(point_type) == point
  end
end
