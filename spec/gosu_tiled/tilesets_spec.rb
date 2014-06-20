require 'spec_helper'

RSpec.describe Gosu::Tiled::Tilesets do

  let(:files_dir) { File.join(File.dirname(File.dirname(__FILE__)), 'files') }
  let(:target_class) { Gosu::Tiled::Tilesets }
  let(:map_json) { JSON.load(File.open(File.join(files_dir, 'tiled_map.json'))) }
  let(:game_window) { TestGameWindow.new(640, 480, false) }
  let(:water_tile) { 65 }

  subject(:tilesets) { target_class.new(game_window, map_json['tilesets'], files_dir) }

  describe '#initialize' do
    it 'initializes with game window and hash' do
      expect { tilesets }.to_not raise_error
    end
  end

  describe '#size' do
    it 'loads correct number of tilesets' do
      expect(tilesets.size).to eq 2
    end
  end

  describe '#get' do
    it 'gets the right tile' do
      expect(tilesets.get(water_tile)).to be_a Gosu::Image
    end

    it 'can draw the tile that was retrieved' do
      game_window.while_showing do
        tilesets.get(water_tile).draw(0, 0, 0)
      end
    end

  end

end
