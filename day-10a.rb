adaptors = File.read('day-10-input').split("\n").map(&:to_i).sort
puts adaptors.inspect

one_count = 0
two_count = 0
three_count = 0

adaptors.inject(0) { |previous, current|
  one_count += 1 if current - previous == 1
  two_count += 1 if current - previous == 2
  three_count += 1 if current - previous == 3
  
  current
}
three_count += 1 # built in


puts one_count
puts two_count
puts three_count
puts "Answer: #{one_count * three_count}"