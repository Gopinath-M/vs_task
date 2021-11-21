class WaterJug
  def initialize(volumes, to_get)
    @volumes = volumes
    @to_get = to_get
    @temp_ouput = Float::INFINITY
  end

  def trans(from, to, cap)
    [from, cap - to].min
  end

  def temp_ouput
    @temp_ouput < Float::INFINITY ? @temp_ouput - 1 : "No solution."
  end
  def add_temp_ouput(arr)
    @temp_ouput = [@temp_ouput.is_a?(String) ? arr.length : @temp_ouput, arr.length].min
  end

  def probe(arr, from, to)
    return if arr.length >= @temp_ouput
    a = arr.last.dup
    trans = trans(a[from], a[to], @volumes[to])
    return if trans < 1
    a[from] -= trans
    a[to] += trans
    return if arr.include?(a)
    iterator(arr.dup.push(a))
  end

  def iterator(arr)
    a = arr.last
    if a == @to_get
      add_temp_ouput(arr)
    else
      3.times do |from|
        3.times do |to|
          probe(arr, from, to) if from != to
        end
      end
    end
  end

  def output
    return temp_ouput if @to_get.sum != @volumes.last
    iterator([[0, 0, @volumes.last]])
    temp_ouput
  end
end

def problem_four(start, to_get)
  WaterJug.new(start, to_get).output
end


puts problem_four([3, 5, 8], [0, 3, 5])