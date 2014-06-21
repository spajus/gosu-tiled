require 'spec_helper'

RSpec.describe Gosu::Tiled::Layer do

  let(:files_dir) { File.join(File.dirname(File.dirname(__FILE__)), 'files') }
  let(:target_class) { Gosu::Tiled::Layer }
  let(:map_json) { JSON.load(File.open(File.join(files_dir, 'tiled_map.json'))) }
  let(:game_window) { TestGameWindow.instance }

  subject(:tilesets) { Gosu::Tiled::Tilesets.new(game_window, map_json['tilesets'], files_dir) }
  subject(:layer1) { target_class.new(game_window, map_json['layers'][1], 128, 128) }

  describe '#initialize' do
    it 'initializes' do
      expect { layer1 }.to_not raise_error
    end
  end

  describe '#visible?' do
    it "knows when it's visible" do
      expect(layer1).to be_visible
    end
  end

  describe '#type' do
    it 'knows correct type' do
      expect(layer1.type).to eq 'tilelayer'
    end
  end

  describe '#draw' do
    it 'draws the layer' do
      error = game_window.while_showing do
        layer1.draw(0, 0, tilesets)
      end

      expect(error).to be_nil
    end
  end

  describe '#tile_width' do
    it 'has correct tile width' do
      expect(layer1.tile_width).to be 128
    end
  end

  describe '#tile_height' do
    it 'has correct tile height' do
      expect(layer1.tile_height).to be 128
    end
  end

  describe '#screen_width_in_tiles' do
    it 'knows how many tiles to draw' do
      expect(layer1.screen_width_in_tiles).to be 5
    end
  end

  describe '#screen_height_in_tiles' do
    it 'knows how many tiles to draw' do
      expect(layer1.screen_height_in_tiles).to be 4
    end
  end
end
