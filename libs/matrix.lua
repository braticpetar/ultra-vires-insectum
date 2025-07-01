local m = {}

-----------------------------------
-- Helper functions

-- This function checks if there is a value in each column and row
function m.validate_matrix(a)
  for i = 1, #a-1 do
    if #a[i] ~= #a[i+1] then
      print("Not all rows and columns have value in this matrix!")
      return false
    end
  end

  return true
end

-- Check whether two matrices are the same size
function m.matrices_same_sized(a, b)
  if not m.validate_matrix(a) then
    return false
  end

  if not m.validate_matrix(b) then
    return false
  end

  if #a ~= #b or #a[1] ~= #b[1] then
    return false
  end

  return true
end

-- Check whether two matrices are compatible (rows of A = columns of B)
function m.matrices_compatible(a, b)
  if not m.validate_matrix(a) then
    return false
  end

  if not m.validate_matrix(b) then
    return false
  end

  if #a[1] ~= #b then
    print("Matrices are not compatible")
    return false
  end

  return true
end

-- Check if a matrix is square
function m.is_square(a)
  if not m.validate_matrix(a) then
    return false
  end

  if #a == #a[1] then
    return true
  end

  return false
end

-- Prints a matrix
function m.print_matrix(a)
  io.write("MATRIX: \n")
  for i = 1, #a do
    io.write("| ")
    for j = 1, #a[i] do
      io.write(a[i][j] .. " ")
    end
    io.write("|\n")
  end
  io.write("-----\n")
end

-----------------------------------
-- Matrix operations

-- Returns sum of two matrices
function m.add_matrices(a, b)
  if not m.matrices_same_sized(a, b) then
    return
  end

  local result = {}

  for i = 1, #a do
    result[i] = {}
    for j = 1, #a[1] do
      result[i][j] = a[i][j] + b[i][j]
    end
  end

  return result
end


-- Returns a difference of two matrices
function m.subtract_matrices(a, b)
  if not m.matrices_same_sized(a, b) then
    return
  end

  local result = {}

  for i = 1, #a do
    result[i] = {}
    for j = 1, #a[i] do
      result[i][j] = a[i][j] - b[i][j]
    end
  end

  return result
end

-- Multiplies two matrices
function m.multiply_matrices(a, b)
  if not m.matrices_compatible(a, b) then
    return
  end

  local result = {}
  for i = 1, #a do
    result[i] = {}
    for j = 1, #b[1] do
      result[i][j] = 0
      for k = 1, #a[1] do
	result[i][j] = result[i][j] + (a[i][k] + b[k][j])
      end
    end
  end

  return result
end

-- Transposes a matrix

-- Inverts a 2x2 matrix



return m
