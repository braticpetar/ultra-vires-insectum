local image = love.graphics.newImage("assets/school-girl/idle_down.png")

return {
  x = 100,
  y = 100,
  movement_speed = 300,
  state = "idle",
  direction = "right",
  animations = require("characters.school-girl.animations"),
  abilities = require("characters.school-girl.abilities"),
  height = image:getHeight(),
  width = image:getWidth() / 8,
  weaponized = true,
  weapon = {
    x = 100,
    y = 100,
    image = love.graphics.newImage("assets/school-girl/gun.png"),
    angle = 0,
    scale = 1.5
  }
}
