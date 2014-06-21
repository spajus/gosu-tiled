require 'singleton'

class TestGameWindow < Gosu::Window
  include Singleton

  def initialize
    super(1200, 800, false)
    self.caption = "Esc = quit"
  end

  def update
    unless ENV['NO_CLOSE']
      close if @start && Gosu.milliseconds - @start > 500
    end
  end

  def draw
    @draw_block.call
  rescue => e
    unless @error
      puts e
      puts e.backtrace
    end
    @error = e
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def while_showing(&block)
    @start = Gosu.milliseconds
    @error = nil
    @draw_block = block
    show
    @start = false
    @error
  end
end
