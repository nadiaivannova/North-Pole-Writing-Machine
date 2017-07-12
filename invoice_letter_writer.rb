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
behavior          = kid_data_array[2]
house_value       = kid_data_array[13].to_i
nice_toys         = kid_data_array[3..8]
naughty_toys      = kid_data_array[8]
toy_list          = []
toy_bill = {}

kid_data_array[3..8].each do |toy|
  toy_bill[:name]= toy
  if house_value > 1000000
     toy_price = 1000
  elsif house_value >= 200000 && house_value <= 1000000
     toy_price = 100
  elsif house_value < 200000
    toy_price = 0
  end
  toy_bill[:price] = toy_price
  toy_list << toy_bill
end

filename    = 'letters/invoices/' + name + '.txt'
letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

puts "Writing #{filename}."
File.write(filename, letter_text)

end

puts 'Done!'
