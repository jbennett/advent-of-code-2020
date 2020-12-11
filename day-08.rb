require 'set'

original_instructions = File.read('day-08-input').split("\n").map do |line|
	parts = line.split(" ")
	
	[
		parts[0],
		parts[1].to_i,
	]
end

highwater = nil
instructions = original_instructions.clone
tries = 0

loop do
	accumulator = 0
	pointer = 0
	history = []
	
	loop do
		break if pointer == instructions.length # termination!
		break if history.include? pointer # infinite
		history << pointer
		
		case instructions[pointer][0]
		when "nop"
			pointer += 1
		when "acc"
			accumulator += instructions[pointer][1]
			pointer += 1
		when "jmp"
			pointer += instructions[pointer][1]
		end
	end
	
	if pointer == instructions.length
		puts "program ran to completion after #{tries} tries"
		puts "Pointer: #{pointer}"
		puts "Acc: #{accumulator}"
		break
	end
	
	highwater = highwater.nil? ? history.length - 1: highwater - 1
	mutation = history[highwater]
	instructions = original_instructions.dup
	instructions[mutation] = ["nop", original_instructions[mutation][1]] if original_instructions[mutation][0] == "jmp"
	instructions[mutation] = ["jmp", original_instructions[mutation][1]] if original_instructions[mutation][0] == "nop"
	
	tries += 1
	break if tries > 100 # infinite loops
	break if highwater < 0
end

puts "failed" if tries > 100
puts "buffer underrun" if highwater < 0