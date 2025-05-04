local Animation = require("libs.animation")
local transform = require("libs.cord-inversion")

local animator = {}

-- ############################
-- ##### Return functions #####
-- ############################

function animator.update(entity, dt)

  -- Check if we are rotating the weapon or not  
  if entity.weaponized then
    update_weapon(entity, dt)
  end

  -- Either way, we update the character
  update_character(entity, dt)
  end

function animator.draw(entity)

  -- Check if we are rotating the weapon or not
  if entity.weaponized then
    draw_weapon(entity)
  end

  -- Either way, we update the character
  draw_character(entity)

  end

-- ############################
-- ##### Helper functions #####
-- ############################

local mouseX, mouseY

function update_weapon(entity, dt)
  mouseX, mouseY = love.mouse.getPosition()
  entity.weapon.angle = math.atan2(mouseY - entity.weapon.y, mouseX - entity.weapon.x)
  entity.weapon.x = entity.x
  entity.weapon.y = entity.y
end

function draw_weapon(entity)
  --if entity.direction == "right" or then
    love.graphics.draw(entity.weapon.image, entity.weapon.x, entity.weapon.y, entity.weapon.angle)
 -- elseif entity.direction == "left" then
    --love.graphics.draw(entity.weapon.image, entity.weapon.x, entity.weapon.y, entity.weapon.angle, entity.weapon.scale, -entity.weapon.scale)
  --end
end

function update_character(entity, dt)
  -- Key is formed with "state" + "_" + "direction"
  -- All animation names need to be properly configured in order for this to work
  -- We decide which animation is the corect 
  local key = entity.state .. "_" .. entity.direction

  -- And we pull that animation from our entity value, and store it in a local variable
  local anim = entity.animations[key]

  -- If it's correctly pulled, we set current animation value and give it to the update func
  if anim then
    entity.current_animation = anim
    Animation.update(anim, dt)
  end
end

function draw_character(entity)
  -- We handle this error, if it's correctly assigned it should exist
  if entity.current_animation then

    -- And we draw it, on the x and y axis
    Animation.draw(entity.current_animation, entity.x, entity.y)
  end
end

return animator
