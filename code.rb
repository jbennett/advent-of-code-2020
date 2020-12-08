grid = File.read('day-03-input').split("\n").map { |x| x.split "" }

rows = grid.count
cols = grid[0].count

slopes = [[1,1], [3, 1], [5,1], [7,1], [1, 2]].map do |x_step, y_step|
	x = y = 0
	trees = 0
	
	loop do
		y += y_step
		x += x_step
		break if y >= rows
		
		wrapped_x = x % cols
		wrapped_y = y % rows
		
		trees += 1 if grid[wrapped_y][wrapped_x] == '#'
	end
	
	trees
end

puts slopes.inspect
puts slopes.inject(:*)