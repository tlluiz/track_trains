require 'trips'

describe Trips do
  let(:string_tracks) { ['AB5','BC4','CD8','DC8','DE6','AD5','CE2','EB3','AE7'] }

  subject { described_class.new(string_tracks) }

  describe '.new' do
    context 'given a array of string tracks' do

      it 'returns a array of structs track' do
        expect(subject.tracks).to be_a Array
        expect(subject.tracks.first).to be_a Track
      end
    end
  end

  describe '.distance_of_the_route' do
    it { is_expected.to respond_to(:distance_of_the_route) }

    it 'Output #1' do
      expect(subject.distance_of_the_route('A-B-C')).to eq(9)
    end

    it 'Output #2' do
      expect(subject.distance_of_the_route('A-D')).to eq(5)
    end

    it 'Output #3' do
      expect(subject.distance_of_the_route('A-D-C')).to eq(13)
    end

    it 'Output #4' do
      expect(subject.distance_of_the_route('A-E-B-C-D')).to eq(22)
    end

    it 'Output #5' do
      expect(subject.distance_of_the_route('A-E-D')).to eq('NO SUCH ROUTE')
    end
  end

  describe '.time_of_the_route' do
    it { is_expected.to respond_to(:time_of_the_route) }

    context 'when have a uniq route' do
      it 'to calculate same time' do
        expect(subject.time_of_the_route('A-B')).to eq(5)
      end
    end

    context "when have a just one stop" do
      it 'to calculate the time plus the stop increament' do
        expect(subject.time_of_the_route('A-B-C')).to eq(11)
      end
    end

  end

  describe '.number_of_trips' do
    it { is_expected.to respond_to(:number_of_trips) }

    it 'Output #6' do
      params = { start_point: 'C', end_point: 'C', max_stops: 3 }

      expect(subject.number_of_trips(params)).to eq(2)
    end

    it 'Output #7' do
      params = { start_point: 'A', end_point: 'C', max_stops: 4, min_stops: 4 }

      expect(subject.number_of_trips(params)).to eq(3)
    end
  end

  describe '.shortest_trip' do
    it { is_expected.to respond_to(:number_of_trips) }

    it 'Output #8' do
      params = { start_point: 'A', end_point: 'C' }

      expect(subject.distance_of_shortest_trip(params)).to eq(9)
    end

    # xit 'Output #9' do
    #   params = { start_point: 'B', end_point: 'B' }
    #
    #   expect(subject.distance_of_shortest_trip(params)).to eq(9)
    # end

  end
end
