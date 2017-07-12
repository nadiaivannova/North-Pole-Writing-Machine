require 'erb'

kids_data   = File.read('data/kids-data.txt')
invoice_letter = File.read('templates/invoice_letter_template.txt.erb')

kids_data.each_line do |kid|

kid_data_array = kid.split

name        = kid_data_array[0]
# address block
numb        = kid_data_array[9]
st_name     = kid_data_array[10]
st_sufix    = kid_data_array[11]
pc          = kid_data_array[12]
# billing
house_value = kid_data_array[13]

# toys by behavior
naughty_toy = kid_data_array[8]
nice_toy    = kid_data_array[3..8]


# next unless behavior == 'naughty'
# behavior    = kid_data_array[2]



filename    = 'letters/invoices/' + name + '.txt'
letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

puts "Writing #{filename}."
File.write(filename, letter_text)

end

puts 'Done!'
