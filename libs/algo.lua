local alg = {}

function alg.sort(elements)

  for i=1, #elements do
    min_index = i
    for j=i+1, #elements do
      if elements[j].y+elements[j].height < elements[min_index].y+elements[min_index].height then
	min_index = j
      end
    end

    temp = elements[i]
    elements[i] = elements[min_index]
    elements[min_index] = temp
  end
end

return alg
