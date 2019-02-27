# menu = {
#   "1" => {"name" => "coffee", "ingredients" => [{"grounds" => 1}, {"hot water" => 2}]},
#   "2" => {"name" => "cappuccino", "ingredients" => [{"grounds" => 1}, {"foamed_milk" => 2}]},
#   "3" => {"name" => "espresso", "ingredients" => [{"grounds" => 3}]},
#   "4" => {"name" => "americano", "ingredients" => [{"grounds" => 1}, {"hot_water" => 4}]}  
#   }
# # p menu.length
# new_menu_item = {"5" => {"name" => "latte", "ingredients" => [{"grounds" => 1}, {"steamed_milk" => 3}]}}
# menu = menu.merge(new_menu_item)
# stock = {"foamed_milk" => 10, "grounds" => 10, "hot_water" => 10}
# user_input = "4"
# # p menu[user_input]["name"]
# selection = menu[user_input]
# fetch = selection["ingredients"]
# fetch.length.times do |i|
#   stock = fetch[i].merge(stock) {|_, oldval, newval| newval - oldval }
# end
# # p stock.sort.to_h

#add item
puts "Please enter the amount of ingredients:"
user_input = gets.chomp.to_i



def new_ingrdient(number)
  items = []
  hash = {}
  number.times do
    puts "Name:"
    ingredient_name = gets.chomp 
    puts "Amount: "
    ingredient_amount = gets.chomp.to_i
    hash[ingredient_name] = ingredient_amount
    items.push(hash)
    hash = {}
  end
  return items
end

p new_ingrdient(user_input)