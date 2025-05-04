local Animation = require("libs.animation")

local images = {
  idle_down = love.graphics.newImage("assets/enemies/bug-dummy.png")
}

local frames_number = 1
local fps = 1
local scale = 0.25 

return {
  idle_III = Animation.new(images.idle_down, frames_number, fps, false, scale),
}
