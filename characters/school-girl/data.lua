local image = love.graphics.newImage("assets/school-girl/idle_I.png")
local shadow_image = love.graphics.newImage("assets/shadow.png")

return {
  x = 1,
  y = 1,
  movement_speed = 100,
  state = "idle",
  direction = "I",
  health = 100,
  animations = require("characters.school-girl.animations"),
  abilities = require("characters.school-girl.abilities"),
  height = image:getHeight(),
  width = image:getWidth() / 8,
  shadow = {
    image = shadow_image,
    x = 0,
    y = 0,
    r = shadow_image:getWidth() / 2,
  }
}
