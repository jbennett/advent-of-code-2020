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

puts "Invalid input: #{current_pointer} => #{input[current_pointer]}"
puts "All good" if current_pointer == input.length