require 'spec_helper'

RSpec.describe Gosu::Tiled::Layer do

  let(:files_dir) { File.join(File.dirname(File.dirname(__FILE__)), 'files') }
  let(:target_class) { Gosu::Tiled::Layer }
  let(:map_json) { JSON.load(File.open(File.join(files_dir, 'tiled_map.json'))) }
  let(:game_window) { TestGameWindow.instance }

  subject(:tilesets) { Gosu::Tiled::Tilesets.new(game_window, map_json['tilesets'], files_dir) }
  subject(:tile_layer) { target_class.new(game_window, map_json['layers'][1], 128, 128) }
  subject(:object_layer) { target_class.new(game_window, map_json['layers'][3], 128, 128) }

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

  describe '#tile_width' do
    it 'has correct tile width' do
      expect(tile_layer.tile_width).to be 128
    end
  end

  describe '#tile_height' do
    it 'has correct tile height' do
      expect(tile_layer.tile_height).to be 128
    end
  end

  describe '#screen_width_in_tiles' do
    it 'knows how many tiles to draw' do
      expect(tile_layer.screen_width_in_tiles).to be game_window.width / 128
    end
  end

  describe '#screen_height_in_tiles' do
    it 'knows how many tiles to draw' do
      expect(tile_layer.screen_height_in_tiles).to be game_window.height / 128
    end
  end
end
