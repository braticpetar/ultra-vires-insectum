local m = require("libs.math") -- To calculate the distance

local c = {}

function c.movement_colliding(entity1, entity2)
  -- We make a tiny circle near the character's feet

  -- We measure the distance between two circles
  local distance = m.distance(entity1.shadow.x, entity1.shadow.y, entity2.shadow.x, entity2.shadow.y)

  -- If distance is less than sum of circle radiuses return true
  return distance - (entity1.shadow.r + entity2.shadow.r) < 0 
end

return c
