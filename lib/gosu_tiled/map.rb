module Gosu
  module Tiled
    class Map
      attr_reader :tilesets, :layers, :width, :height

      def initialize(window, data, data_dir)
        @window = window
        @data = data
        @data_dir = data_dir
        @width = data['width'] * data['tilewidth']
        @height = data['height'] * data['tileheight']
        @tilesets = Tilesets.new(window, data['tilesets'], data_dir)
        @layers = Layers.new(window,
                             data['layers'],
                             width: @width,
                             height: @height,
                             tile_width: data['tilewidth'],
                             tile_height: data['tileheight'])
      end

      def draw(offset_x, offset_y)
        @layers.each do |layer|
          layer.draw(offset_x, offset_y, tilesets)
        end
      end
    end
  end
end
