sudoku_correct =[[8,3,5,4,1,6,9,2,7],
               [2,9,6,8,5,7,4,3,1],
               [4,1,7,2,9,3,6,5,8],
               [5,6,9,1,3,4,7,8,2],
               [1,2,3,6,7,8,5,4,9],
               [7,4,8,5,2,9,1,6,3],
               [6,5,2,7,8,1,3,9,4],
               [9,8,1,3,4,5,2,7,6],
               [3,7,4,9,6,2,8,1,5]]

sudoku_incorrect =[[ 1, 1, 2, 4, 8, 9, 3, 7, 6 ],
                  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
                  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
                  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
                  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
                  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
                  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
                  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
                  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]]

def problem_three(input)
  if input.length != 9
    return false
  else
    transpose_input = input.transpose # input for row and transpose_inpit for column
    input.zip(transpose_input).each do |a,b| 
      if (a.uniq.length == a.length) && (b.uniq.length == b.length)  # condition check for duplicate and length
        grids = []
        input.each_slice(3) do |input_split|
          temp_grids = [[],[],[]]
          input_split.each do |each_row|
            each_row.each_slice(3).with_index  do|s,i|
              temp_grids[i] = temp_grids[i] + s
            end
          end
          grids +=  temp_grids
        end
        grids
        return true
      else
        return false
      end
    end
  end
end

puts problem_three(sudoku_correct)
puts problem_three(sudoku_incorrect)
                 
