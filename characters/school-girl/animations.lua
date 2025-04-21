local idle_down_image = love.graphics.newImage("assets/player/idle_down.png")
local idle_side_image = love.graphics.newImage("assets/player/idle_side.png")
local idle_up_image = love.graphics.newImage("assets/player/idle_up.png")

local walk_down_image = love.graphics.newImage("assets/player/walk_down.png")
local walk_side_image = love.graphics.newImage("assets/player/walk_side.png")
local walk_up_image = love.graphics.newImage("assets/player/walk_up.png")

local dash_down_image = love.graphics.newImage("assets/player/dash_down.png")
local dash_side_image = love.graphics.newImage("assets/player/dash_side.png")
local dash_up_image = love.graphics.newImage("assets/player/dash_up.png")`

idle_right = Animation(idle_side_image, 8, 10, false, 3),
idle_left = Animation(idle_side_image, 8, 10, true, 3),
idle_up = Animation(idle_up_image, 8, 10, false, 3), 
idle_down = Animation(idle_down_image, 8, 10, false, 3),

running_right = Animation(walk_side_image, 8, 10, false, 3), 
running_left = Animation(walk_side_image, 8, 10, true, 3),

running_up = Animation(walk_up_image, 8, 10, false, 3),
running_down = Animation(walk_down_image, 8, 10, false, 3),

dashing_right = Animation(dash_side_image, 8, 10, false, 3),
dashing_left = Animation(dash_side_image, 8, 10, true, 3), 

dashing_up = Animation(dash_up_image, 8, 10, false, 3),
dashing_down = Animation(dash_down_image, 8, 10, false, 3)
