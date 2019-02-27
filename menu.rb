
class Menu

  @@stock = {"vanilla" => 10, "cherry" => 10, "lime" => 10, "coke" => 10, "dr. pepper" => 10, "diet coke" => 10, "soda" => 10}
  @@menu = {
  "1" => {"name" => "Vanilla Coke", "ingredients" => [{"vanilla" => 1}, {"coke" => 2}]},
  "2" => {"name" => "Cherry Dr.Pepper", "ingredients" => [{"cherry" => 2}, {"dr. pepper" => 2}]},
  "3" => {"name" => "Lime Diet Coke", "ingredients" => [{"lime" => 3}, {"diet coke" => 2}]},
  "4" => {"name" => "Soda", "ingredients" => [{"soda" => 4}]}  
  }

  def print_menu
    user_menu = []
    i = 1
    (menu.length).times do
      user_menu << i.to_s + " " + @menu[i.to_s]["name"].capitalize
      i += 1
    end
    return user_menu
  end

  def add_menu_item(number, name)
    @new_menu_item = {number => {"name" => name, "ingredients" => new_ingredients}}
    @@menu = @@menu.merge(@new_menu_item)
    return @@menu
  end

  def new_ingredients
    items = []
    hash = {}
    2.times do
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

  def print_stock
    @stock.each do |k,v| 
      p k + "," + v.to_s
    end
  end
end

menu = Menu.new
p menu.add_menu_item("5", "Latte")


class User < Menu

  def initialize(user_input)
    @user_input = user_input
  end

  def vend
    selection = menu[@user_input]
    grab_item = selection["ingredients"]
    grab_item.length.times do |i|
      @@stock = grab_item[i].merge(@@stock) {|_, oldval, newval| newval - oldval }
    end
    return @@stock.sort.to_h
  end

end

user = User.new("1")

