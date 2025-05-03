local camera = {
  x = 0,
  y = 0,
  zoom = 2,
  screen_width = love.graphics.getWidth(),
  screen_height = love.graphics.getHeight(),
}

-- We set the camera to player's coordinates in order to follow him
function camera.setPlayerPosition(x, y)
  camera.x = x
  camera.y = y
end

-- We get the mouse position and add camera's offset to it so it moves as the camera moves
function camera.getWorldMouse()
  local mx, my = love.mouse.getPosition()
  mx = mx + camera.x - camera.screen_width/2
  my = my + camera.y - camera.screen_height/2
  return mx, my
end

-- We apply the camera "effect" including the zoom
-- Called before drawing anything on the screen
function camera.apply()
  love.graphics.push()
  love.graphics.translate(camera.screen_width/2, camera.screen_height/2)
  love.graphics.scale(camera.zoom)
  love.graphics.translate(-camera.x, -camera.y)
end

-- Called at the end of drawing everything on the screen
function camera.clear()
  love.graphics.pop()
end

-- We zoom in and out using the mouse scroll
function love.wheelmoved(dx, dy)
  local current_zoom = camera.zoom

  if dy < 0 and current_zoom > 0.66 then
    camera.zoom = camera.zoom + dy / 4
  elseif dy > 0 and current_zoom < 6 then
    camera.zoom = camera.zoom + dy / 4
  end
end

return camera
