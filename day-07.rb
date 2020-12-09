rules = File.read('day-07-input').split("\n")
rules = rules.map do |rule|
  parts = rule.match(/(.*) bags contain (.*)./)
  name = parts[1]
  bags = parts[2].split(', ').map do |bag|
    m = bag.match(/(\d*) (.*) bag\s*/)
    [m[2], m[1].to_i] unless m[2] == 'other bags'
  end.compact.to_h
  
  [name, bags]
end.to_h
# puts rules.inspect

bags_to_search_for = ["shiny gold"]
holding_bags = []

while !bags_to_search_for.empty? do
  search = bags_to_search_for.pop
  # puts "seaching for #{search}"
  
  rules.each do |name, bags|
    if bags[search]
      # puts "adding #{name}"
      bags_to_search_for << name
      holding_bags << name
    else
      # puts "did not find #{search} in #{name}"
    end
  end
end

puts holding_bags.uniq.count
