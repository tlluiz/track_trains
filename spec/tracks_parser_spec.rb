require 'tracks_parser'

describe TracksParser do
  describe '.parser' do
    let(:string_tracks) { ['AB5','BC4','CD8','DC8','DE6','AD5','CE2','EB3','AE7'] }

    describe '.parser' do
      it 'returns an Array of Tracks' do
        expect(described_class.parse(string_tracks)).to be_a Array
        expect(described_class.parse(string_tracks).first).to be_a Track
      end

      it 'returns correct track attributes' do
        expect(described_class.parse(string_tracks).first.start_point).to eq('A')
        expect(described_class.parse(string_tracks).first.end_point).to eq('B')
        expect(described_class.parse(string_tracks).first.distance).to eq(5)
      end
    end

    describe '.update_possible_trips' do
      let(:tracks) { described_class.parse(string_tracks) }
      it 'returns tracks with updated possible_trips' do
        updated_tracks = described_class.update_possible_trips(tracks)
        expect(updated_tracks.first.possible_trips).to eq(1)
        expect(updated_tracks[5].possible_trips).to eq(2)
      end
    end

  end
end
