require './lib/item'
class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, quantity)
    if @inventory.include?(item)
      @inventory[item] += quantity
    else
      @inventory[item] = quantity
    end
  end

  def potential_revenue
    total_revenue = 0.00
    @inventory.each_pair{|item, quantity| total_revenue += item.price.delete("$").to_f * quantity}
    total_revenue
  end
end
