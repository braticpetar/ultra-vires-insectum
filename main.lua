local input = require("core.input")
local animator = require("core.animator")
local mapper = require("core.map-drawer")
local camera = require("core.camera")
local transform = require("libs.cord-inversion")

local dummy = require("maps.dummy")
--local player = require("characters.school-girl.data")

-- Add all enemies here for a mass update
---local enemies = {
--  require("characters.enemy-dummy.data")
--}

local characters = {
  require("characters.school-girl.data"),
  require("characters.enemy-dummy.data")
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
  characters[1].x, characters[1].y = transform.screen_to_iso(15, 30, characters[1].height)
  characters[2].x, characters[2].y = transform.screen_to_iso(15, 5, characters[2].height)
end

function love.update(dt)
  -- We set the camera position to the player's position
  camera.setPlayerPosition(characters[1].x+50, characters[1].y)
  -- We get the actual mouse coordinates in the world
  local worldX, worldY = camera.getWorldMouse()

  -- Handle player updates
  input.update(characters[1], worldX, worldY, dt)

  -- Handle enemy updates
  for _, character in ipairs(characters) do
    animator.update(character, dt)
  end
end

function love.draw()
  -- Apply camera before drawing everything
  camera.apply()

  -- Draw the map
  mapper.draw(dummy)

  -- Draw characters 
  for _, character in ipairs(characters) do
    animator.draw(character)
    if character.health then
      love.graphics.print("HP: " .. character.health, character.x, character.y)
    end
  end

  -- Reset camera settings
  camera.clear()
end
