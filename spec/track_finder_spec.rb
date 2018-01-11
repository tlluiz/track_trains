require 'track_finder'
require 'tracks_parser'
require 'route'

describe TrackFinder do
  let(:string_tracks) { ['AB5','BC4','CD8','DC8','DE6','AD5','CE2','EB3','AE7'] }
  let(:tracks) { TracksParser.parse(string_tracks) }
  let(:route) { Route.new(start_point: 'A', end_point: 'B') }

  subject { TrackFinder.new(tracks) }

  describe '.find_by_route' do
    context 'when given a route' do
      it 'returns the related track object' do
        expect(subject.find_by_route(route)).to be_a Track

        expect(subject.find_by_route(route).start_point).to eq('A')
        expect(subject.find_by_route(route).end_point).to eq('B')
        expect(subject.find_by_route(route).distance).to eq(5)
      end
    end
  end

  describe '.find_by_point' do
    context 'when given a point and the point_type is default start_point' do
      it 'return the related tracks' do
        expect(subject.find_by_point(point: 'A').count).to eq(3)
        expect(subject.find_by_point(point: 'A').map {|t| t.start_point }).to match(['A','A','A'])
      end
    end

    context 'when given a point and the point_type is end_point' do
      it 'return the related tracks' do
        params = { point: 'E', point_type: :end_point }

        expect(subject.find_by_point(params).count).to eq(3)
        expect(subject.find_by_point(params).map {|t| t.end_point }).to match(['E','E','E'])
      end
    end
  end
end
