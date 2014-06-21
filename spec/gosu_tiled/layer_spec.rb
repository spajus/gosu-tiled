require 'spec_helper'

RSpec.describe Gosu::Tiled::Layer do

  let(:files_dir) { File.join(File.dirname(File.dirname(__FILE__)), 'files') }
  let(:target_class) { Gosu::Tiled::Layer }
  let(:map_json) { JSON.load(File.open(File.join(files_dir, 'tiled_map.json'))) }
  let(:game_window) { TestGameWindow.instance }
  let(:options) { { width: 128 * 10, height: 128 * 10, tile_width: 128, tile_height: 128 } }

  subject(:tilesets) { Gosu::Tiled::Tilesets.new(game_window, map_json['tilesets'], files_dir) }
  subject(:tile_layer) { target_class.new(game_window, map_json['layers'][1], options) }
  subject(:object_layer) { target_class.new(game_window, map_json['layers'][3], options) }

  describe '#initialize' do
    it 'initializes' do
      expect { tile_layer }.to_not raise_error
    end
  end

  describe '#visible?' do
    it "knows when it's visible" do
      expect(tile_layer).to be_visible
    end
  end

  describe '#type' do
    it 'knows correct type' do
      expect(tile_layer.type).to eq 'tilelayer'
    end
  end

  describe '#draw' do
    it 'draws tile layer' do
      error = game_window.while_showing do
        tile_layer.draw(0, 0, tilesets)
      end
      expect(error).to be_nil
    end

    it 'draws object layer' do
      error = game_window.while_showing do
        object_layer.draw(0, 0, tilesets)
      end
      expect(error).to be_nil
    end
  end

  describe '#screen_width_in_tiles' do
    it 'knows how many tiles to draw' do
      expect(tile_layer.screen_width_in_tiles).to be (game_window.width / 128.0).ceil
    end
  end

  describe '#screen_height_in_tiles' do
    it 'knows how many tiles to draw' do
      expect(tile_layer.screen_height_in_tiles).to be (game_window.height / 128.0).ceil
    end
  end
end
