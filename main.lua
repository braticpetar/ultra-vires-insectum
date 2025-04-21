local movement = require("core.movement")
local animator = require("core.animator")

local characters = {
  require("characters.school-girl.data")
}

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
  for _, char in ipairs(characters) do
    animator.draw(char)
  end
end
