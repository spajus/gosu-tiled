class TestGameWindow < Gosu::Window
  def initialize(*args)
    super
  end

  def draw
    @draw_block.call if @draw_block
  end

  def update
    caption_msg = "Esc = quit"
    unless @freeze
      left = 2000 - Gosu.milliseconds - @start
      close if left <= 0
      caption_msg << ", Space = freeze, auto close in #{left} ms"
    end
    self.caption = caption_msg
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    @freeze = true if id == Gosu::KbSpace
  end

  def while_showing(&block)
    @draw_block = block
    start_timer
    show
  end

  private

  def start_timer
    @start = Gosu.milliseconds
  end
end
