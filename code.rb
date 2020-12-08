passwords = File.read('day-2-input').split("\n")

parsed_passwords = passwords.map { |password| password.match /(\d*)-(\d*)\s(.):\s(.*)/ }
valid_passwords = parsed_passwords.select do |p|
	min = p[1].to_i
	max = p[2].to_i
	search = p[3]
	sample = p[4]
	count = sample.count(search)
	
	count >= min && count <= max
end


puts valid_passwords.inspect
puts valid_passwords.count
