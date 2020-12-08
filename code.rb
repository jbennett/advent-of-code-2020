grid = File.read('day-03-input').split("\n").map { |x| x.split "" }

rows = grid.count
cols = grid[0].count
x_step = 3
y_step = 1
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

puts trees
