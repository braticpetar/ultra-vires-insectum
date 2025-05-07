local image = love.graphics.newImage("assets/enemies/enemy2.png")
local shadow_image = love.graphics.newImage("assets/shadow.png")

return function()
  return {
   x = 0,
    y = 0,
    movement_speed = 100,
    state = "idle",
    direction = "III",
    animations = require("characters.enemy-dummy.animations"),
    health = 100,
    height = image:getHeight(),
    width = image:getWidth(),
    shadow = {
      image = shadow_image,
      x = 1,
      y = 1,
      r = 4,
    }
  }
end
