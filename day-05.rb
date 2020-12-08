
tickets = File.read('day-05-input').split("\n")

ids = tickets.map do |ticket|
  row_range = [0, 127]
  col_range = [0, 7]
  
  ticket.split("").each do |letter|
    row_range[1] -= (row_range[1] - row_range[0] + 1) / 2 if letter == "F"
    row_range[0] += (row_range[1] - row_range[0] + 1) / 2 if letter == "B"
    col_range[1] -= (col_range[1] - col_range[0] + 1) / 2 if letter == "L"
    col_range[0] += (col_range[1] - col_range[0] + 1) / 2 if letter == "R"
  end
  
  puts "#{row_range[1]}:#{col_range[0]} -> #{row_range[0] * 8 + col_range[0]}"

  row_range[0] * 8 + col_range[0]
end

puts ids.max