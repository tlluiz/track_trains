Route = Struct.new(:start_point, :end_point) do

  def initialize(start_point:, end_point:)
    self.start_point = start_point
    self.end_point = end_point
  end
end
