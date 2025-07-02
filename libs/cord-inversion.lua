local inversion = {}

local matrix = require("libs.matrix")
cube = love.graphics.newImage("cubes/cube.png")
cube_width = cube:getWidth()
cube_height = cube:getHeight()

local screen_width = love.graphics.getWidth() 
local screen_height = love.graphics.getHeight()

local transformation_matrix = {
  { cube_width / 2, -cube_width / 2},
  { cube_height / 4, cube_height / 4 }
}

-- Taking certain coordinates and transforming them into iso coordinates
function inversion.screen_to_iso(sx, sy, obj_height)
  local inverted_coordinates

  local cords = {{sx, sy}}

  -- We compute the coordinates 
  inverted_coordinates = matrix.multiply_matrices(cords, transformation_matrix)
  --ix = matrix[1][1] * sx + matrix[1][2] * sy
  --iy = matrix[2][1] * sx + matrix[2][2] * sy

  -- Then apply offsets
  --ix = ix - (cube_width / 2 - screen_width / 4)
  --iy = iy - (-screen_height / 8)

  -- and take sprite's height into a consideration
  --inverted_coordinates[2] = iy - obj_height / 2

  return inverted_coordinates[1][1], inverted_coordinates[1][2]
end

-- Having isometric coordinates and transforming them into actual screen coordinates
function inversion.iso_to_screen(ix, iy)
  local reversed_cords
  
  local cords = {{ix, iy}}
  local sx
  local sy
  -- We undo the transformation
  reversed_cords = matrix.multiply_matrices(cords, matrix.invert_matrix2(transformation_matrix))
  --sx = (ix - iy) * cube_width / 2
  --sy = (ix + iy) * cube_height / 4

  -- Undo the offset
  --sx = sx - cube_width / 2 + screen_width / 4
  --sy = sy + screen_height / 8

  return reversed_cords[1][1], reversed_cords[1][2]
  --return sx, sy
end

return inversion

