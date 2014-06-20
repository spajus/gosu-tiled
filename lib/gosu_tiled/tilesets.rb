module Gosu
  module Tiled
    class Tilesets
      def initialize(window, data, data_dir)
        @root_dir = data_dir
        @window = window
        @data = data
        puts 'data'
        puts data
        @tilesets = {}
        @data.each do |t|
          puts "Loading: #{t['image']} as #{t['firstgid']}"
          tileset = Gosu::Image.load_tiles(
            @window, File.join(data_dir, t['image']), t['tilewidth'], t['tileheight'], true)
          @tilesets[t['firstgid']] = tileset
        end
      end

      def size
        @data.size
      end

      def get(index)
        key = closest_key(index)
        @tilesets[key][key - index]
      end

      private

      def closest_key(index)
        @tilesets.keys.select { |k| k <= index }.max
      end
    end
  end
end
