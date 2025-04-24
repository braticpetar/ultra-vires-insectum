local map = {}

function map.draw(level_map)
  local cube = level_map.cube
  local grid = level_map.grid
  local grid_size = level_map.grid_size

  love.graphics.scale(2, 2)

  for i=1, grid_size do
    for j=1, grid_size do
      if grid[i][j] == 1 then
	love.graphics.draw(cube, (i-j)*cube_width/2, (i+j)*cube_height/4, 0, 1, 1, cube_width/2 - love.graphics.getWidth() / 2 / 2, -love.graphics.getHeight() / 4 / 2)
      end
    end
  end

--  for layer_index, layer in ipairs(level_map.grid) do
--    for row_index, row in ipairs(layer) do
--      for col_index, cell in ipairs(row) do

--	if cell == 0 then
--	  love.graphics.draw(level_map.cube, (row_index-col_index)*cube_width/2, (row_index+col_index)*cube_height/4, 0, 1, 1, cube_width/2 - love.graphics.getWidth()/2 /2, -love.graphics.getHeight() /4/2)
--	end
--      end
--    end
--  end

  love.graphics.origin()
end

return map
