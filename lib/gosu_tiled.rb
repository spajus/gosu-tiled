require 'gosu'
require 'json'
require 'gosu_tiled/version'
require 'gosu_tiled/empty_tile'
require 'gosu_tiled/tilesets'
require 'gosu_tiled/layer'
require 'gosu_tiled/layers'
require 'gosu_tiled/map'

module Gosu
  module Tiled
    def self.load_json(window, json)
      Map.new(window, JSON.load(File.open(json)), File.dirname(json))
    end
  end
end
