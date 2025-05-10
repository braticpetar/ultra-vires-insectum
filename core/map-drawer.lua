local map = {}

local transform = require("libs.cord-inversion")

function map.draw(level_map)
  local cube 
  local grid = level_map.grid
  local grid_height = level_map.height
  local grid_width = level_map.width

  -- We loop through the whole grid table
  for h=1, grid_height do
    for w=1, grid_width do
      -- If it's 1 then we draw certain cube
      if grid[h][w] == 1 then
      	cube = level_map.grass
      elseif grid[h][w] == 2 then
     	cube = level_map.street_I
      elseif grid[h][w] == 3 then
      	cube = level_map.street_III
      elseif grid[h][w] == 4 then
      	cube = level_map.street_II
      elseif grid[h][w] == 5 then
      	cube = level_map.street_IV
      elseif grid[h][w] == 6 then
      	cube = level_map.side_walk
      elseif grid[h][w] == 7 then
      	cube = level_map.street_blank 	
      elseif grid[h][w] == 0 then
	goto continue
      end
      
      -- Outsorced to transform function
      local x, y = transform.iso_to_screen(w, h)
      love.graphics.draw(cube, x, y)
      ::continue::
    end
  end
end

return map
