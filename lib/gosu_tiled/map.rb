module Gosu
  module Tiled
    class Map
      def initialize(window, data, data_dir)
        @window = window
        @data = data
        @data_dir = data_dir
        @tilesets = Tilesets.new(window, data['tilesets'], data_dir)
      end

      def tilesets
        @tilesets
      end

      def draw(offset_x, offset_y)
      end
    end
  end
end
