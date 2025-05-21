local inversion = {}

cube = love.graphics.newImage("cube.png")
cube_width = cube:getWidth()
cube_height = cube:getHeight()

local screen_width = love.graphics.getWidth() 
local screen_height = love.graphics.getHeight()

-- Taking certain coordinates and transforming them into iso coordinates
function inversion.screen_to_iso(sx, sy, obj_height)

  -- This is our transformational matrix
  local matrix = {
    {cube_width / 2, -cube_width / 2},
    {cube_height / 4, cube_height / 4}
  }

  local ix, iy

  -- We compute the coordinates 
  ix = matrix[1][1] * sx + matrix[1][2] * sy
  iy = matrix[2][1] * sx + matrix[2][2] * sy

  -- Then apply offsets
  ix = ix - (cube_width / 2 - screen_width / 4)
  iy = iy - (-screen_height / 8)

  -- and take sprite's height into a consideration
  iy = iy - obj_height / 2

  return ix, iy
end

-- Having isometric coordinates and transforming them into actual screen coordinates
function inversion.iso_to_screen(ix, iy)
  local sx
  local sy
  -- We undo the transformation
  sx = (ix - iy) * cube_width / 2
  sy = (ix + iy) * cube_height / 4

  -- Undo the offset
  sx = sx - cube_width / 2 + screen_width / 4
  sy = sy + screen_height / 8

  return sx, sy
end

return inversion

