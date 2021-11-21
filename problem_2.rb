array = ["oven", "envier", "erase", "serious"]

def problem_two(input_array)
    op, cnt = input_array.each_cons(2).map do |str1,str2|
        a = [str1.size, str2.size].min.downto(1).find { |n| str1[-n..-1] == str2[0,n] }
        a.nil? ? [str2, 0] : [str2[a..-1],a]
    end.transpose
    [input_array.first + op.join, cnt.min]
end


puts problem_two(array)