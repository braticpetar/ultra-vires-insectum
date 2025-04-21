local Animation = require("libs.animation")

local animator = {}

-- Key is formed with state _ direction
-- All animation names need to be properly configured in order for this to work
function animator.update(entity, dt)

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

function animator.draw(entity)

  -- We handle this error, if it's correctly assigned it should exist
  if entity.current_animation then

    -- And we draw it, on the x and y axis
    Animation.draw(entity.current_animation, entity.x, entity.y)
  end
end

return animator
