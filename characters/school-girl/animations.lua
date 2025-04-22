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

-- Animation.new(image, frames_number, fps, flipped, scale)
local frames_number = 8
local fps = 10 
local scale = 3

return {
  idle_right = Animation.new(images.idle_side, frames_number, fps, false, scale),
  idle_left = Animation.new(images.idle_side, frames_number, fps, true, scale),
  idle_up = Animation.new(images.idle_up, frames_number, fps, false, scale), 
  idle_down = Animation.new(images.idle_down, frames_number, fps, false, scale),

  running_right = Animation.new(images.walk_side, frames_number, fps, false, scale), 
  running_left = Animation.new(images.walk_side, frames_number, fps, true, scale),

  running_up = Animation.new(images.walk_up, frames_number, fps, false, scale),
  running_down = Animation.new(images.walk_down, frames_number, fps, false, scale),

  dashing_right = Animation.new(images.dash_side, frames_number, fps, false, scale),
  dashing_left = Animation.new(images.dash_side, frames_number, fps, true, scale), 

  dashing_up = Animation.new(images.dash_up, frames_number, fps, false, scale),
  dashing_down = Animation.new(images.dash_down, frames_number, fps, false, scale),
}
