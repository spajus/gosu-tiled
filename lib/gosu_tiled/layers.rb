module Gosu
  module Tiled
    class Layers
      include Enumerable
      def initialize(window, data, tile_width, tile_height)
        @window = window
        @layers = data.map do |layer|
          Layer.new(window, layer, tile_width, tile_height)
        end
        @tile_width = tile_width
        @tile_height = tile_height
      end

      def tile
        @layers.select(&:visible?).select { |l| l.type == 'tilelayer' }
      end

      def size
        @layers.size
      end

      def tile_width
        @tile_width
      end

      def tile_height
        @tile_height
      end

      def each(&block)
        tile.each do |layer|
          if block_given?
            block.call(layer)
          else
            yield layer
          end
        end
      end
    end
  end
end
