local movement = require("core.movement")
local animator = require("core.animator")
local mapper = require("core.map-drawer")
local camera = require("core.camera")

local dummy = require("maps.dummy")
local player = require("characters.school-girl.data")

-- Add all enemies here for a mass update
local enemies = {
}

-- Handles unit tests
if arg[2] == "test" then
  local t = require("tests.test_characters")

  for _, char in ipairs(characters) do
    t.test_animations(char, 8)
  end
  love.event.quit()
end


function love.load()
  cube = love.graphics.newImage("cube.png")
  cube_width = cube:getWidth()
  cube_height = cube:getHeight()

  --love.window.setFullscreen(true)

end

function love.update(dt)
  -- We set the camera position to the player's position
  camera.setPlayerPosition(player.x+50, player.y)
  -- We get the actual mouse coordinates in the world
  local worldX, worldY = camera.getWorldMouse()

  -- Handle player updates
  movement.update(player, worldX, worldY, dt)
  animator.update(player, dt)

  -- Handle enemy updates
  for _, enemy in ipairs(enemies) do
    animator.update(enemy, dt)
  end
end

function love.draw()
  -- Apply camera before drawing everything
  camera.apply()

  -- Draw the map
  mapper.draw(dummy)

  -- Draw the player
  animator.draw(player)

  -- TODO draw enemies
  for _, enemy in ipairs(enemies) do
  end

  -- Reset camera settings
  camera.clear()
end
