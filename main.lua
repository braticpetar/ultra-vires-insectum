local movement = require("core.movement")
local animator = require("core.animator")
local mapper = require("core.map-drawer")

local dummy = require("maps.dummy")

local characters = {
  require("characters.school-girl.data")
}

function love.load()
  cube = love.graphics.newImage("cube.png")
  cube_width = cube:getWidth()
  cube_height = cube:getHeight()
end

function love.update(dt)
  for _, char in ipairs(characters) do
    movement.update(char, dt)
    animator.update(char, dt)

    if char.abilities and char.abilities.update then
      char.abilities.update(char, dt)
    end
  end
end

function love.draw()
  screen_width = love.graphics.getWidth()

  mapper.draw(dummy)

  for _, char in ipairs(characters) do
    animator.draw(char)
  end
end
