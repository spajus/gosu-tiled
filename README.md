# gosu-tiled

[Tiled](http://www.mapeditor.org/) map loader for [Gosu](http://www.libgosu.org) game development library.

# How to use it?

First, download [Tiled](http://www.mapeditor.org/) and create yourself a map.

![Tiled Map](https://raw.githubusercontent.com/spajus/gosu-tiled/master/examples/screenshots/tiled.png)

Then export it as JSON and use with Gosu like this:

```ruby
require 'gosu'
require 'gosu_tiled'

class GameWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    @map = Gosu::Tiled.load_json(self, 'path/to/map.json')
    @x = @y = 0
  end

  def update
    @factor = 3
    @x -= @factor if button_down?(Gosu::KbLeft)
    @x += @factor if button_down?(Gosu::KbRight)
    @y -= @factor if button_down?(Gosu::KbUp)
    @y += @factor if button_down?(Gosu::KbDown)
  end

  def draw
    @map.draw(@x, @y)
  end
end

GameWindow.new.show
```

Run it and enjoy your game map:

![Gosu Game](https://raw.githubusercontent.com/spajus/gosu-tiled/master/examples/screenshots/gosu_tiled.gif)

See [full example code](https://github.com/spajus/gosu-tiled/blob/master/examples/panorama.rb).

