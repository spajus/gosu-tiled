module Gosu
  module Tiled
    class Map
      def initialize(window, data, data_dir)
        @window = window
        @data = data
        @data_dir = data_dir
        @tilesets = Tilesets.new(window, data['tilesets'], data_dir)
        @layers = Layers.new(window, data['layers'], data['tilewidth'], data['tileheight'])
      end

      def tilesets
        @tilesets
      end

      def layers
        @layers
      end

      def draw(offset_x, offset_y)
        @layers.each do |layer|
          layer.draw(offset_x, offset_y, tilesets)
        end
      end
    end
  end
end
