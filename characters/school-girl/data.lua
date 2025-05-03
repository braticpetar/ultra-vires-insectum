local image = love.graphics.newImage("assets/school-girl/idle_I.png")

return {
  x = 100,
  y = 100,
  movement_speed = 100,
  state = "idle",
  direction = "I",
  animations = require("characters.school-girl.animations"),
  abilities = require("characters.school-girl.abilities"),
  height = image:getHeight(),
  width = image:getWidth() / 8,
}
