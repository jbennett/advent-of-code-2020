passwords = File.read('day-2-input').split("\n")

parsed_passwords = passwords.map { |password| password.match /(\d*)-(\d*)\s(.):\s(.*)/ }
valid_passwords = parsed_passwords.select do |p|
	first = p[1].to_i
	second = p[2].to_i
	search = p[3]
	sample = p[4]
	
	(sample[first - 1] == search) ^ (sample[second - 1] == search)
end

puts valid_passwords.inspect
puts valid_passwords.count
