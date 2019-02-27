class Menu

  @@stock = {"foamed_milk" => 10, "grounds" => 10, "hot_water" => 10}

  def menu
    @menu = {
  "1" => {"name" => "coffee", "ingredients" => [{"grounds" => 1}, {"hot_water" => 2}]},
  "2" => {"name" => "cappuccino", "ingredients" => [{"grounds" => 1}, {"foamed_milk" => 2}]},
  "3" => {"name" => "espresso", "ingredients" => [{"grounds" => 3}]},
  "4" => {"name" => "americano", "ingredients" => [{"grounds" => 1}, {"hot_water" => 4}]}  
  }
  end

  def print_menu
    user_menu = []
    i = 1
    (menu.length).times do
      user_menu << i.to_s + " " + @menu[i.to_s]["name"].capitalize
      i += 1
    end
    return user_menu
  end

  def add_menu_item(number, name, ingredients, amount)
    @new_menu_item = {number => {"name" => name, "ingredients" => [{ingredients => amount}]}}
    @menu = @menu.merge(@new_menu_item)
    return @menu
  end

  # def stock
  #   @stock = {"foamed_milk" => 10, "grounds" => 10, "hot_water" => 10}
  # end

  def print_stock
    @stock.each do |k,v| 
      p k + "," + v.to_s
    end
  end
end


class User < Menu

  def initialize(user_input)
    @user_input = user_input
  end

  def vend
    selection = menu[@user_input]
    grab_item = selection["ingredients"]
    # p grab_item
    grab_item.length.times do |i|
      @@stock = grab_item[i].merge(@@stock) {|_, oldval, newval| newval - oldval }
      p @@stock
    end
    return @@stock.sort.to_h
  end

end

user = User.new("1")
# p user.print_menu
# p user.vend
p user.print_menu
