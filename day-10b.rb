adaptors = File.read('day-10-input').split("\n").map(&:to_i).sort
puts adaptors.inspect

one_count = 0
two_count = 0
three_count = 0

adaptors_to_remove = 0
sequences = []
loop do
  
  
  
  
  adaptors_to_remove += 1
  break if adaptors_to_remove == adaptors.count # yeah, we can quit a lot sooner
end

puts sequences.flatten(1).count