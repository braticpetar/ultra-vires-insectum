local Animation = require("libs.animation")

local images = {
  idle_down = love.graphics.newImage("assets/school-girl/idle_down.png"),
  idle_side = love.graphics.newImage("assets/school-girl/idle_side.png"),
  idle_up = love.graphics.newImage("assets/school-girl/idle_up.png"),

  walk_down = love.graphics.newImage("assets/school-girl/walk_down.png"),
  walk_side = love.graphics.newImage("assets/school-girl/walk_side.png"), 
  walk_up = love.graphics.newImage("assets/school-girl/walk_up.png"),

  dash_down = love.graphics.newImage("assets/school-girl/dash_down.png"),
  dash_side = love.graphics.newImage("assets/school-girl/dash_side.png"),
  dash_up = love.graphics.newImage("assets/school-girl/dash_up.png")
}

return function()
  return {
    idle_right = Animation.new(images.idle_side, 8, 10, false, 3),
    idle_left = Animation.new(images.idle_side, 8, 10, true, 3),
    idle_up = Animation.new(images.idle_up, 8, 10, false, 3), 
    idle_down = Animation.new(images.idle_down, 8, 10, false, 3),

    running_right = Animation.new(images.walk_side, 8, 10, false, 3), 
    running_left = Animation.new(images.walk_side, 8, 10, true, 3),

    running_up = Animation.new(images.walk_up, 8, 10, false, 3),
    running_down = Animation.new(images.walk_down, 8, 10, false, 3),

    dashing_right = Animation.new(images.dash_side, 8, 10, false, 3),
    dashing_left = Animation.new(images.dash_side, 8, 10, true, 3), 

    dashing_up = Animation.new(images.dash_up, 8, 10, false, 3),
    dashing_down = Animation.new(images.dash_down, 8, 10, false, 3)
}
end
