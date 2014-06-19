module Gosu
  module Tiled
    class Map
      def initialize(window, data)
        @window = window
        @data = data
        @tilesets = Tilesets.new(data['tilesets'])
      end

      def tilesets
        @tilesets
      end

      def draw(offset_x, offset_y)
      end
    end
  end
end
