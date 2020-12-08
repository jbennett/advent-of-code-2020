credentials = File.read('day-04-input').split("\n\n").map { |x| x.scan(/([a-z]*):([^:\s]*)/).to_h }

required_keys = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

valid_credentials = credentials.select { |c| (required_keys - c.keys).empty? }

valid_credentials.each { |x| puts x.inspect }
puts valid_credentials.count