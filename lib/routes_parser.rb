require 'route'

class RoutesParser
  class << self
    def parse(string_routes)
      points = string_routes.split('-')

      routes = []

      points.size.times do |index|
        next if points.fetch(index + 1, 'error') == 'error'
        routes << Route.new(
          start_point: points.fetch(index),
          end_point: points.fetch(index + 1)
        )
      end

      routes
    end
  end
end
