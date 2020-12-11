require 'set'

instructions = File.read('day-08-input').split("\n").map do |line|
	parts = line.split(" ")
	
	[
		parts[0],
		parts[1].to_i,
	]
end

accumulator = 0
pointer = 0
history = Set.new

loop do
	break if history.include? pointer
	history << pointer
	puts "running: #{pointer}"
	
	case instructions[pointer][0]
	when "nop"
		nil
		pointer += 1
	when "acc"
		accumulator += instructions[pointer][1]
		pointer += 1
	when "jmp"
		pointer += instructions[pointer][1]
	end
end

puts "Acc: #{accumulator}"