require 'spec_helper'

RSpec.describe Gosu::Tiled::Tilesets do

  let(:files_dir) { File.join(File.dirname(File.dirname(__FILE__)), 'files') }
  let(:target_class) { Gosu::Tiled::Tilesets }
  let(:map_json) { JSON.load(File.open(File.join(files_dir, 'tiled_map.json'))) }
  let(:game_window) { TestGameWindow.instance }
  let(:water_tile) { 65 }
  let(:sand_tile) { 1 }

  subject(:tilesets) { target_class.new(game_window, map_json['tilesets'], files_dir) }

  describe '#initialize' do
    it 'initializes with game window and hash' do
      expect { tilesets }.to_not raise_error
    end
  end

  describe '#size' do
    it 'loads correct number of tilesets' do
      expect(tilesets.size).to eq map_json['tilesets'].size
    end
  end

  describe '#get' do
    it 'gets the right water tile' do
      expect(tilesets.get(water_tile)).to be_a Gosu::Image
    end

    it 'gets the right sand tile' do
      expect(tilesets.get(sand_tile)).to be_a Gosu::Image
    end

    it 'can draw the tile that was retrieved' do
      error = game_window.while_showing do
        tilesets.get(sand_tile).draw(0, 0, 0)
      end
      expect(error).to be_nil
    end

    it 'returns empty tile' do
      expect(tilesets.get(0)).to be_a Gosu::Tiled::EmptyTile
    end
  end

  describe '#properties' do
    it 'retrieves tile properties' do
      expect(tilesets.properties(water_tile)['name']).to eq 'water'
    end
  end

end
