local m = require("libs.math") -- To calculate the distance

local c = {}

function c.movement_colliding(entity1, entity2)
  -- We make a tiny circle near the character's feet
  local circle1_x = entity1.x + entity1.width / 2
  local circle1_y = entity1.y + entity1.height - 20
  local circle1_r = 4

  local circle2_x = entity2.x + entity2.width / 2
  local circle2_y = entity2.y + entity2.height - 20
  local circle2_r = 4

  -- We measure the distance between two circles
  local distance = m.distance(circle1_x, circle1_y, circle2_x, circle2_y)

  -- If distance is less than sum of circle radiuses return true
  return distance - (circle1_r + circle2_r) < 0 
end




return c
