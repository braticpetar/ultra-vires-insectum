local movement = {}

function movement.update(entity, dt)
  -- We use these local variables as a vector that we later normalize
  local moveX = 0
  local moveY = 0

  -- Handle up and down, with correct states and directions
  if love.keyboard.isDown("w") then
   entity.direction = "up"
   entity.state = "running"
   moveY = moveY - 1
  elseif love.keyboard.isDown("s") then
    entity.direction = "down"
    entity.state = "running"
    moveY = moveY + 1
  end

  -- Separately handle left and right so they can work at the same time
  if love.keyboard.isDown("a") then
    entity.direction = "left"
    entity.state = "running"
    moveX = moveX - 1
  elseif love.keyboard.isDown("d") then
    entity.direction = "right"
    entity.state = "running"
    moveX = moveX + 1
  end

  -- If no other keys are pressed, then character is idle, but direction is the same as last
  if not (moveX ~= 0 or moveY ~= 0) or love.keyboard.isDown("lshift") then
    entity.state = "idle"
  end

  -- We normalize the vector, in order to have accurate diagonal movement
  local length = math.sqrt(moveX^2 + moveY^2)
  if length > 0 then
    moveX = moveX / length
    moveY = moveY / length
  end

  -- Handle a dash, which just multiplies that vector by 10 and changes player state
  if love.keyboard.isDown("lshift") then
    entity.state = "dashing"
    moveX = moveX * 10
    moveY = moveY * 10
  end

  -- Increment our entities x and y values times movement speed each frame
  entity.x = entity.x + moveX * entity.movement_speed * dt
  entity.y = entity.y + moveY * entity.movement_speed * dt
end

return movement
