groups = File.read('day-06-input').split("\n\n")

yes_counts = groups.map do |group|
  group.split("\n").map { |x| x.split("") }.inject(:&).count
end

puts yes_counts.sum
