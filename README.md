# gosu-tiled

[![Gem Version](https://badge.fury.io/rb/gosu_tiled.svg)](http://badge.fury.io/rb/gosu_tiled)
[![Code Climate](https://codeclimate.com/github/spajus/gosu-tiled.png)](https://codeclimate.com/github/spajus/gosu-tiled)

[Tiled](http://www.mapeditor.org/) map loader for [Gosu](http://www.libgosu.org) game development library.

## How to use it?

Install the gem:

```console
gem install gosu_tiled
```

Create yourself a game map with [Tiled](http://www.mapeditor.org/):

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
    @speed = 3
  end

  def update
    @x -= @speed if button_down?(Gosu::KbLeft)
    @x += @speed if button_down?(Gosu::KbRight)
    @y -= @speed if button_down?(Gosu::KbUp)
    @y += @speed if button_down?(Gosu::KbDown)
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

## TODO

- Caching and other performance improvements

## Contributing

0. Read [CONTRIBUTING.md](https://github.com/spajus/gosu-tiled/blob/master/CONTRIBUTING.md)
1. Fork it ( https://github.com/spajus/gosu-tiled/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
