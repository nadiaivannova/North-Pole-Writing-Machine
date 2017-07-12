require 'erb'

kids_data   = File.read('data/kids-data.txt')

kids_data.each_line do |kid|
  kid_data_array    = kid.split
  behavior          = kid_data_array[2]
  house_value       = kid_data_array[13].to_i
  nice_toys         = kid_data_array[3..8]
  naughty_toys      = kid_data_array[8]
  toy_list          = []
  toy_bill = {}

  #   if behavior  == 'nice'
  #     # puts 'yes'
  #     puts toy_list_nice = nice_toys
  #   elsif behavior == 'naughty'
  #       # puts toy_list_naughty << naughty_toys
  #     puts 'no'
  # end


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
    # puts toy_bill
    toy_list << toy_bill
    puts toy_list
    puts toy_list[:name]
    puts toy_list[:price]
  end
end
