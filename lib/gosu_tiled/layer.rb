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
        (@window.width / tile_width.to_f).ceil
      end

      def screen_height_in_tiles
        (@window.height / tile_height.to_f).ceil
      end

      private

      def offset_x_in_tiles(x)
        x / tile_width
      end

      def offset_y_in_tiles(y)
        y / tile_height
      end

      def draw_tiles(x, y, tilesets)
        off_x = offset_x_in_tiles(x)
        off_y = offset_y_in_tiles(y)
        tile_range_x = (off_x..screen_width_in_tiles + off_x)
        tile_range_y = (off_y..screen_height_in_tiles + off_y)
        tile_range_x.each do |xx|
          tile_range_y.each do |yy|
            tilesets.get(tile_at(xx, yy)).draw(transpose_tile_x(xx, x), transpose_tile_y(yy, y), 0)
          end
        end
      end

      def transpose_tile_x(x, off_x)
        x * tile_width - off_x
      end

      def transpose_tile_y(y, off_y)
        y * tile_height - off_y
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
