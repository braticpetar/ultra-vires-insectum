local Animation = require("libs.animation")

local images = {
  idle_up = love.graphics.newImage("assets/school-girl/idle_I.png"),
  idle_down = love.graphics.newImage("assets/school-girl/idle_IV.png"),

  running_up = love.graphics.newImage("assets/school-girl/walk_I.png"),
  running_down = love.graphics.newImage("assets/school-girl/walk_IV.png"),
}

-- Animation.new(image, frames_number, fps, flipped, scale)
local frames_number = 8
local fps = 10 
local scale = 1

return {
  idle_I = Animation.new(images.idle_up, frames_number, fps, false, scale),
  idle_II = Animation.new(images.idle_up, frames_number, fps, true, scale),
  idle_III = Animation.new(images.idle_down, frames_number, fps, true, scale),
  idle_IV = Animation.new(images.idle_down, frames_number, fps, false, scale),

  running_I = Animation.new(images.running_up, frames_number, fps, false, scale),
  running_II = Animation.new(images.running_up, frames_number, fps, true, scale),
  running_III = Animation.new(images.running_down, frames_number, fps, true, scale),
  running_IV = Animation.new(images.running_down, frames_number, fps, false, scale),
}
