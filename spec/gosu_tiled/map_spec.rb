require 'spec_helper'

RSpec.describe Gosu::Tiled::Map do

  let(:files_dir) { File.join(File.dirname(File.dirname(__FILE__)), 'files') }
  let(:target_class) { Gosu::Tiled::Map }
  let(:map_json) { JSON.load(File.open(File.join(files_dir, 'tiled_map.json'))) }
  let(:game_window) { TestGameWindow.instance }

  subject(:map) { target_class.new(game_window, map_json, files_dir) }

  describe '#initialize' do
    it 'initializes with window and hash' do
      expect { map }.to_not raise_error
    end
  end

  describe '#tilesets' do
    it 'returns instance of Tilesets' do
      expect(map.tilesets).to be_a Gosu::Tiled::Tilesets
    end
  end

  describe '#layers' do
    it 'returns instance of Layers' do
      expect(map.layers).to be_a Gosu::Tiled::Layers
    end
  end

  describe '#width' do
    it "knows it's width" do
      expect(map.width).to be 128 * 10
    end
  end

  describe '#height' do
    it "knows it's height" do
      expect(map.height).to be 128 * 10
    end
  end

  describe '#draw' do
    it 'draws the map on game window' do
      error = game_window.while_showing do
        map.draw(0, 0)
      end
      expect(error).to be_nil
    end

    it 'draws shifted map on game window' do
      error = game_window.while_showing do
        map.draw(300, 400)
      end
      expect(error).to be_nil
    end
  end

end
