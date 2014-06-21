require 'spec_helper'

RSpec.describe Gosu::Tiled::Layers do

  let(:files_dir) { File.join(File.dirname(File.dirname(__FILE__)), 'files') }
  let(:target_class) { Gosu::Tiled::Layers }
  let(:map_json) { JSON.load(File.open(File.join(files_dir, 'tiled_map.json'))) }
  let(:game_window) { TestGameWindow.instance }
  let(:options) { { width: 128 * 10, height: 128 * 10, tile_width: 128, tile_height: 128 } }

  subject(:layers) { target_class.new(game_window, map_json['layers'], options) }

  describe '#initialize' do
    it 'works' do
      expect { layers }.to_not raise_error
    end
  end

  describe '#tile' do
    it 'loads correct number of tile layers' do
      expect(layers.tile.size).to be 2
    end
  end

  describe '#object' do
    it 'loads correct number of object layers' do
      expect(layers.object.size).to be 1
    end
  end

  describe '#size' do
    it 'loads correct number of layers' do
      expect(layers.size).to eq map_json['layers'].size
    end
  end

end
