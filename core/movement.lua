local movement = {}

local cube = love.graphics.newImage("cube.png")
local cube_width = cube:getWidth()
local cube_height = cube:getHeight()

function movement.update(entity, dt)
  mouse_handler(entity, dt)
  keyboard_handler(entity, dt)
 end

function mouse_handler(entity, dt)
  -- We get the x and y coordinate of the mouse
  local mouseX, mouseY = love.mouse.getPosition()

  -- We calculate the angle between character and mouse
  local angle = math.deg(math.atan2(mouseY - (entity.y + entity.height), mouseX - (entity.x + entity.width))) % 360

  -- Depending on the angle, we change character's position
  if angle >= 0 and angle < 90 then
    entity.direction = "IV"
  elseif angle < 270 and angle > 180 then
    entity.direction = "II"
  elseif angle < 180 and angle > 90 then
    entity.direction = "III"
  else --angle is between 360 and 0
    entity.direction = "I"
  end
end

function keyboard_handler(entity, dt)
  -- We use these local variables as a vector that we later normalize
  local moveX = 0
  local moveY = 0

  -- Handle up and down, with correct states and directions
  if love.keyboard.isDown("w") then
   entity.state = "running"
   moveY = moveY - 1
  elseif love.keyboard.isDown("s") then
    entity.state = "running"
    moveY = moveY + 1
  end

  -- Separately handle left and right so they can work at the same time
  if love.keyboard.isDown("a") then
    entity.state = "running"
    moveX = moveX - 1
  elseif love.keyboard.isDown("d") then
    entity.state = "running"
    moveX = moveX + 1
  end

  -- If no other keys are pressed, then character is idle, but direction is the same as last
  if not (moveX ~= 0 or moveY ~= 0) then
    entity.state = "idle"
  end

  moveX = moveX * cube_width / 2
  moveY = moveY * cube_height / 4

  -- We normalize the vector, in order to have accurate diagonal movement
  local length = math.sqrt(moveX^2 + moveY^2)
  if length > 0 then
    moveX = moveX / length
    moveY = moveY / length
  end

  
  -- Increment our entities x and y values times movement speed each frame
  entity.x = entity.x + moveX * entity.movement_speed * dt
  entity.y = entity.y + moveY * entity.movement_speed * dt
end

return movement
