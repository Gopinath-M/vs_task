def problem_five(input_arr)
  input_arr.each_cons(3).count { |a,b,c| a == c && a !=b }
end

puts problem_five([9, 5, 9, 5, 1, 1, 1])
puts problem_five([5, 6, 6, 7, 6, 3, 9])
puts problem_five([4, 4, 4, 9, 9, 9, 9])