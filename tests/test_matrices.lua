local matrix = require("libs.matrix")
local t = {}

a = {
  {1, 2, 3},
  {2, 3, 4}
}

local b = {
  {2, 4},
  {1, 1},
  {3, 5}
}

local c = {
  {1, 2, 4, 5, 5, 6},
  {2, 5, 6, 45, 1, 1},
  {1, 2, 2, 2, 2, 2},
  {2, 2, 2, 2, 2, 2}
}

local d = {
  {1, 2, 3},
  {1, 2},
  {1, 2, 2, 2, 2}
}

function t.test()
  print("MATRIX A:")
  matrix.print_matrix(a)
  print("MATRIX B:")
  matrix.print_matrix(b)
  print("B MATRIX TRANSPOSED")
  matrix.print_matrix(matrix.transpose_matrix(b))
  print("MULTIPLICATION")
  matrix.print_matrix(matrix.multiply_matrices(a, b))
  print("ADDITION")
  matrix.print_matrix(matrix.add_matrices(a, a))
  print("SUBTRACTION")
  matrix.print_matrix(matrix.subtract_matrices(b, b))
end

return t


