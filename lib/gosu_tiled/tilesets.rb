module Gosu
  module Tiled
    class Tilesets
      def initialize(data)
        @data = data
      end

      def size
        @data.size
      end
    end
  end
end
