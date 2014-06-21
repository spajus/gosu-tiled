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
    @speed = 3
  end

  def update
    @x -= @speed if button_down?(Gosu::KbLeft) && @x > 0
    @x += @speed if button_down?(Gosu::KbRight) && @x < @map.width - WIDTH
    @y -= @speed if button_down?(Gosu::KbUp) && @y > 0
    @y += @speed if button_down?(Gosu::KbDown) && @y < @map.height - HEIGHT
    self.caption = "#{Gosu.fps} FPS. Mem: #{memory_usage} KB. Loc: [#{@x}:#{@y}]. Use arrow keys"
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def draw
    @map.draw(@x, @y)
  end

  private

  def memory_usage
    `ps -o rss= -p #{Process.pid}`
      .chomp.gsub(/(\d)(?=(\d{3})+(\..*)?$)/,'\1,') + ' KB'
  rescue
    "Unavailable. Using Windows?"
  end
end

GameWindow.new.show

