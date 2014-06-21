module Gosu
  module Tiled
    class Layers
      include Enumerable
      def initialize(window, data, options)
        @window = window
        @layers = data.map do |layer|
          Layer.new(window, layer, options)
        end
      end

      def tile
        @layers.select { |l| l.type == 'tilelayer' }.select(&:visible?)
      end

      def object
        @layers.select { |l| l.type == 'objectgroup' }.select(&:visible?)
      end

      def size
        @layers.size
      end

      def each(&block)
        @layers.each do |layer|
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
