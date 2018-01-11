require 'routes_parser'

describe RoutesParser do
  describe '.parser' do
    let(:string_routes) { 'A-B-C' }

    subject { described_class.parse(string_routes) }

    it 'returns an Array of Routes' do
      expect(subject).to be_a Array
      expect(subject.first).to be_a Route
    end

    it 'returns correct route attributes' do
      expect(subject.first.start_point).to eq('A')
      expect(subject.first.end_point).to eq('B')

      expect(subject.last.start_point).to eq('B')
      expect(subject.last.end_point).to eq('C')
    end
  end
end
