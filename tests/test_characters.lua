local t = {}

function t.test_animations(ch, expected)
  print("----------")
  print("TESTING ANIMATION LOADING")
  local count = 0
  
  for _, animation in pairs(ch.animations) do
    print("Frame loaded")
    count = count + 1
  end

  if count ~= expected then
    print("[FAIL] Expected: " .. expected .. " | Got: " .. count)
  else
    print("[SUCCESS]")
  end

  print("----------")
end

return t


