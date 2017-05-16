strengths = (1..gets.to_i).map {gets.to_i}.sort
puts strengths[0..-2].map.with_index {|x, i| strengths[i+1] - x}.min

# To debug: STDERR.puts "Debug messages..."

# Cool solution by someone else
# p gets.to_i.times.map { gets.to_i }.sort.each_cons(2).map { |a, b| b - a }.min
