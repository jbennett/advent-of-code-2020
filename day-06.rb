groups = File.read('day-06-input').split("\n\n")

yes_counts = groups.map do |group|
  group.gsub("\n", "").split("").uniq.count
end

puts yes_counts.sum