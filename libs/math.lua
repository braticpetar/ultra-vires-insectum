local m = {}

-- Returns a distance between two points
function m.distance(x1, y1, x2, y2)
  return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end

return m
