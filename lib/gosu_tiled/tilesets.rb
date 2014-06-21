module Gosu
  module Tiled
    class Tilesets
      def initialize(window, data, data_dir)
        @root_dir = data_dir
        @window = window
        @data = data
        @tilesets = {}
        @data.each do |t|
          tileset = Gosu::Image.load_tiles(
            @window, File.join(data_dir, t['image']), t['tilewidth'], t['tileheight'], true)
          @tilesets[t['firstgid']] = {
            'data' => t,
            'tiles' => tileset
          }
        end
      end

      def size
        @data.size
      end

      def get(index)
        return empty_tile if index == 0 || index.nil?
        key = closest_key(index)
        @tilesets[key]['tiles'][index - key]
      end

      def properties(index)
        return {} if index == 0
        key = closest_key(index)
        props = @tilesets[key]['data']['tileproperties']
        return {} unless props
        props[(index - key).to_s]
      end

      private

      def empty_tile
        @empty_tile ||= EmptyTile.new
      end

      def closest_key(index)
        @tilesets.keys.select { |k| k <= index }.max
      end
    end
  end
end
