love.graphics.setDefaultFilter("nearest", "nearest")
local player_movement = require("core.player-movement")
local animator = require("core.animator")
local mapper = require("core.map-drawer")
local collider = require("core.collider")
local camera = require("core.camera")
local algo = require("libs.algo")
local transform = require("libs.cord-inversion")
local dummy = require("maps.dummy")
local player = require("characters.school-girl.data")

local enemy_factory = require("characters.enemy-dummy.data")

local enemies = {
  enemy_factory(),
  enemy_factory(),
  enemy_factory(),
  enemy_factory(),
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
  player.x, player.y = transform.screen_to_iso(15, 30, player.height)
  enemies[1].x, enemies[1].y = transform.screen_to_iso(5, 5, enemies[1].height)
  enemies[2].x, enemies[2].y = transform.screen_to_iso(10, 5, enemies[2].height)
  enemies[3].x, enemies[3].y = transform.screen_to_iso(15, 5, enemies[3].height)
  enemies[4].x, enemies[4].y = transform.screen_to_iso(20, 5, enemies[4].height)
end

function love.update(dt)
  -- We set the camera position to the player's position
  camera.setPlayerPosition(player.x+50, player.y)
  -- We get the actual mouse coordinates in the world
  local worldX, worldY = camera.getWorldMouse()

  -- Handle player updates
  player_movement.update(player, worldX, worldY, dt)

  animator.update(player, dt)

  -- Handle enemy updates
  for _, enemy in ipairs(enemies) do
    animator.update(enemy, dt)
    if collider.movement_colliding(enemy, player) then
      print("COLLIDING")
    else
      print("NOT COLLIDING")
    end
  end
end

function love.draw()
  -- Apply camera before drawing everything
  camera.apply()

  -- Draw the map
  mapper.draw(dummy)

  -- Sort the enemies

  local drawList = {player}
  for _, enemy in ipairs(enemies) do
    table.insert(drawList, enemy)
  end

  algo.sort(drawList)

  -- Draw characters 
  for _, char in ipairs(drawList) do
    animator.draw(char)
    if char.health then
      love.graphics.print("HP: " .. char.health, char.x, char.y, 0, 0.5, 0.5)
--      love.graphics.circle("line", char.x + char.width/2, char.y+char.height-20, 4) 
    end
  end

  -- Reset camera settings
  camera.clear()
  love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
end
