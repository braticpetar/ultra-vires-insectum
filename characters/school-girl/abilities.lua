local abilities = {}

function abilities.update(entity, dt)
  if love.keyboard.isDown("lshift") and not entity.dashing then
    entity.dashing = true
    entity.state = "dashing"
  end
end

return abilities
