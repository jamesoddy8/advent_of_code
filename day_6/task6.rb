# split the inputs by group & then by individual people
file_path = File.expand_path('customsforminput.txt')
input = File.read(file_path)

groups = input.split("\n\n")

puts groups.map{ |votes| votes.gsub(/\s/, '').chars.uniq.count }
.sum 
