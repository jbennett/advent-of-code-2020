credentials = File.read('day-04-input').split("\n\n").map { |x| x.scan(/([a-z]*):([^:\s]*)/).to_h }

required_keys = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

valid_credentials = credentials.select do |c| 
	next false unless (required_keys - c.keys).empty?
	next false unless c["byr"].length == 4 && c["byr"].to_i.between?(1920, 2002)
	next false unless c["iyr"].length == 4 && c["iyr"].to_i.between?(2010, 2020)
	next false unless c["eyr"].length == 4 && c["eyr"].to_i.between?(2020, 2030)
	next false unless c["hcl"].match(/^#[a-f0-9]{6}$/)
	next false unless %w[amb blu brn gry grn hzl oth].include?(c["ecl"])
	next false unless c["pid"].match(/^[0-9]{9}$/)
	
	height = c["hgt"].match(/(\d*)(.*)/)
	next false unless %w[in cm].include?(height[2]) # sneaky
	next false if height[2] == "cm" && !height[1].to_i.between?(150, 193)
	next false if height[2] == "in" && !height[1].to_i.between?(59, 76)
	
	true
end

# valid_credentials.each { |x| puts x.inspect }
puts valid_credentials.count
puts "done"