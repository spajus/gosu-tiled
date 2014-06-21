module Gosu
  module Tiled
    class Layer
      def initialize(window, data, tile_width, tile_height)
        @window = window
        @data = data
        @tile_width = tile_width
        @tile_height = tile_height
      end

      def visible?
        @data['visible']
      end

      def tile_width
        @tile_width
      end

      def tile_height
        @tile_height
      end


      def draw(x, y, tilesets)
        (0..screen_width_in_tiles).each do |xx|
          (0..screen_height_in_tiles).each do |yy|
            tilesets.get(tile_at(xx, yy)).draw(xx * tile_width, yy * tile_height, 0)
          end
        end
      end

      def screen_width_in_tiles
        (@window.width.to_f / tile_width.to_f).ceil
      end

      def screen_height_in_tiles
        (@window.height.to_f / tile_height.to_f).ceil
      end

      private

      def tile_at(x, y)
        @data['data'][y * @data['width'] + x]
      end
    end
  end
end
