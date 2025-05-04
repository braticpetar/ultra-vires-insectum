local map = {}

local transform = require("libs.cord-inversion")

function map.draw(level_map)
  local cube = level_map.cube
  local grid = level_map.grid
  local grid_size = level_map.grid_size

  -- We loop through the whole grid table
  for i=1, grid_size do
    for j=1, grid_size do
      -- If it's 1 then we draw certain cube
      if grid[i][j] == 1 then
	-- Outsorced to transform function
	local x, y = transform.iso_to_screen(i, j)
	love.graphics.draw(cube, x, y)
      end
    end
  end
end

return map
