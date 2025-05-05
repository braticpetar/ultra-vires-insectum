return {
  x = 0,
  y = 0,
  movement_speed = 100,
  state = "idle",
  direction = "III",
  animations = require("characters.enemy-dummy.animations"),
  health = 100,
  height = love.graphics.newImage("assets/enemies/enemy2.png"):getHeight()
}
