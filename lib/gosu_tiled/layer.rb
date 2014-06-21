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

      def type
        @data['type']
      end

      def tile_width
        @tile_width
      end

      def tile_height
        @tile_height
      end

      def draw(x, y, tilesets)
        if type == 'tilelayer'
          draw_tiles(x, y, tilesets)
        elsif type == 'objectgroup'
          draw_objects(x, y, tilesets)
        end
      end

      def screen_width_in_tiles
        @window.width / tile_width
      end

      def screen_height_in_tiles
        @window.height / tile_height
      end

      private

      def draw_tiles(x, y, tilesets)
        (0..screen_width_in_tiles).each do |xx|
          (0..screen_height_in_tiles).each do |yy|
            tilesets.get(tile_at(xx, yy)).draw(xx * tile_width, yy * tile_height, 0)
          end
        end
      end

      def draw_objects(x, y, tilesets)
        range_x = (x..@window.width + x)
        range_y = (y..@window.height + y)
        @data['objects'].each do |obj|
          obj_x = obj['x']
          obj_y = obj['y']
          if range_x.include?(obj_x) && range_y.include?(obj_y)
            tilesets.get(obj['gid']).draw(obj_x - x, obj_y - y, 10)
          end
        end
      end

      def tile_at(x, y)
        @data['data'][y * @data['width'] + x]
      end
    end
  end
end
