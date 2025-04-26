local Animation = require("libs.animation")

local images = {
  _idle_I = love.graphics.newImage("assets/school-girl/idle_I.png"),
  _idle_II = love.graphics.newImage("assets/school-girl/idle_II.png"),
  _idle_III = love.graphics.newImage("assets/school-girl/idle_III.png"),
  _idle_IV = love.graphics.newImage("assets/school-girl/idle_IV.png"),

  _running_I = love.graphics.newImage("assets/school-girl/walk_I.png"),
  _running_II = love.graphics.newImage("assets/school-girl/walk_II.png"),
  _running_III = love.graphics.newImage("assets/school-girl/walk_III.png"),
  _running_IV = love.graphics.newImage("assets/school-girl/walk_IV.png"),
}

-- Animation.new(image, frames_number, fps, flipped, scale)
local frames_number = 8
local fps = 10 
local scale = 3

return {
  idle_I = Animation.new(images._idle_I, frames_number, fps, false, scale),
  idle_II = Animation.new(images._idle_II, frames_number, fps, false, scale),
  idle_III = Animation.new(images._idle_III, frames_number, fps, false, scale),
  idle_IV = Animation.new(images._idle_IV, frames_number, fps, false, scale),

  running_I = Animation.new(images._running_I, frames_number, fps, false, scale),
  running_II = Animation.new(images._running_II, frames_number, fps, false, scale),
  running_III = Animation.new(images._running_III, frames_number, fps, false, scale),
  running_IV = Animation.new(images._running_IV, frames_number, fps, false, scale),
}
