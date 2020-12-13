preamble_length = 25
input = File.read('day-09-input').split("\n").map(&:to_i)
# puts input.inspect

current_pointer = preamble_length
loop do
  valid_inputs = input[(current_pointer - preamble_length) .. current_pointer]
  valid_options = valid_inputs.product(valid_inputs).map { |a,b| a != b ? a+b : nil }.uniq.compact
  break unless valid_options.include? input[current_pointer]

  current_pointer += 1
  break if current_pointer == input.length
end

invalid_value = input[current_pointer]
puts "Invalid input: #{current_pointer} => #{invalid_value}"

search_start = 0
search_range = 1
range = nil
loop do
	range = input[search_start .. (search_start + search_range)]
	break if range.sum == invalid_value
	break if search_start == invalid_value
	
	search_range += 1
	if (current_pointer - search_start) < search_range
		search_start += 1
		search_range = 1
	end
end

puts range.inspect
puts "Answer: #{range.min + range.max}"