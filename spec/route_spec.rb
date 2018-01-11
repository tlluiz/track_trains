require 'route'

describe Route do
  describe '.new' do
    context 'given start_point, end_point' do
      let(:attributes) do
        {
          start_point: 'A',
          end_point: 'B',
        }
      end

      subject { described_class.new(attributes) }

      it { is_expected.to respond_to(:start_point) }
      it { is_expected.to respond_to(:end_point) }

      it { expect(subject.start_point).to eq('A') }
      it { expect(subject.end_point).to eq('B') }
    end
  end
end
