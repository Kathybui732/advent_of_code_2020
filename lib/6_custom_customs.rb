file = File.open('./csv_files/6_custom_customs.txt')
data = file.read
file.close

parsed_data = data.split("\n\n")
x = parsed_data.sum do |data|
  data.delete("\n").chars.uniq.count
end

acc = 0
yes_array = []
parsed_data.each do |data|
  yes_data = {}
  group_number = (data.count("\n") + 1)
  data.chars.group_by do |letter|
    yes_data[letter] ||= 0
    yes_data[letter] += 1
    yes_array << {"#{letter}": yes_data[letter]} if yes_data[letter] == group_number
  end
end
require 'pry'; binding.pry
