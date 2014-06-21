ROOT_DIR = File.dirname(File.dirname(__FILE__))

# Add ../lib to load path
$:.unshift File.join(ROOT_DIR, 'lib')

require 'gosu'
require 'gosu_tiled'

class GameWindow < Gosu::Window
  WIDTH = 800
  HEIGHT = 600
  def initialize
    super(WIDTH, HEIGHT, false)
    json_path = File.join(ROOT_DIR, 'spec', 'files', 'tiled_map.json')
    @map = Gosu::Tiled.load_json(self, json_path)
    @x = @y = 0
  end

  def update
    @x -= 1 if button_down?(Gosu::KbLeft)
    @x += 1 if button_down?(Gosu::KbRight)
    @y -= 1 if button_down?(Gosu::KbUp)
    @y += 1 if button_down?(Gosu::KbDown)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def draw
    @map.draw(@x, @y)
  end
end

GameWindow.new.show

