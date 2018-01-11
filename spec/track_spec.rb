require 'track'

describe Track do
  describe '.new' do
    context 'given start_point, end_point and distance' do
      let(:attributes) do
        {
          start_point: 'A',
          end_point: 'B',
          distance: 5,
          possible_trips: 0,
          trips: 0
        }
      end

      subject { described_class.new(attributes) }

      it { is_expected.to respond_to(:start_point) }
      it { is_expected.to respond_to(:end_point) }
      it { is_expected.to respond_to(:distance) }
      it { is_expected.to respond_to(:possible_trips) }
      it { is_expected.to respond_to(:trips) }


      it { expect(subject.start_point).to eq('A') }
      it { expect(subject.end_point).to eq('B') }
      it { expect(subject.distance).to eq(5) }
      it { expect(subject.possible_trips).to eq(0) }
      it { expect(subject.trips).to eq(0) }
    end
  end
end
