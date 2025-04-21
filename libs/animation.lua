local Animation = {}
  
-- When we pass around arguments, we assign them to local variables
function Animation.new(image, frames_number, fps, flipped, scale)
  local anim = {
    image = image,
    frames_number = frames_number,
    fps = fps,
    flipped = flipped or false,
    scale = scale or 1,
    current_frame = 1,
    frames = {}
  }

  -- love.graphics.newQuad(x, y, width, height, reference image width, reference image height)

  local frame_width = image:getWidth() / frames_number -- that is why we pass frames_number
  local frame_height = image:getHeight()

  for i = 0, frames_number - 1 do
    table.insert(anim.frames, love.graphics.newQuad(
      i * frame_width, 0,
      frame_width, frame_height,
      image:getWidth(), image:getHeight()))
      print("frame loaded")
  end

  return anim
end

function Animation.update(anim, dt)
  -- We use the current frame to know which frame to draw
  -- We increase it by the fps number times delta
  anim.current_frame = anim.current_frame + anim.fps * dt

  -- If it reaches maximum number of frames, we reset it to 1
  if anim.current_frame > anim.frames_number then
    anim.current_frame = 1
  end
end

function Animation.draw(anim, x, y)
  -- math floor rounds the gien number down to the neares integer
  -- So we are taking the value of the current frame from frames
  local frame = anim.frames[math.floor(anim.current_frame)]
  local scale = anim.scale

  -- draw(drawable, x, y, orientation, scaleX, scaleY, offsetX, offsetY)

  -- If it's flipped, we scale by negative number on the x axis
  -- And we use offset in case sprite is not centered
  if anim.flipped then 
    local offset = anim.image:getWidth() / anim.frames_number * scale
    love.graphics.draw(anim.image, frame, x + offset, y, 0, -scale, scale)
  else
    love.graphics.draw(anim.image, frame, x, y, 0, scale, scale)
  end
end


return Animation
