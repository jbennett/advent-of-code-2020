@rules = File.read('day-07-input').split("\n")
@rules = @rules.map do |rule|
  parts = rule.match(/(.*) bags contain (.*)./)
  name = parts[1]
  bags = parts[2].split(', ').map do |bag|
    m = bag.match(/(\d*) (.*) bag\s*/)
    [m[2], m[1].to_i] unless m[2] == 'other'
  end.compact.to_h
  
  [name, bags]
end.to_h
# puts @rules.inspect

def bags_in_bag(bag_name)
  @rules[bag_name].map do |name, count|
    (bags_in_bag(name) * count) + count
  end.sum
end

puts "shiny gold contains #{bags_in_bag("shiny gold")} bags"
