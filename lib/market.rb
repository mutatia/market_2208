class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.reject {|vendor| vendor.check_stock(item) == 0}
  end

  def sorted_item_list
    @vendors.each_with_object([]) {|vendor, names| names << vendor.inventory.keys.map {|item| item.name}}.flatten.uniq.sort
  end

  def list_items
    @vendors.map {|vendor| vendor.inventory.keys}.flatten.uniq
  end

  def overstocked_items
    overstocked = []
    items = list_items.reject {|item| vendors_that_sell(item).length < 2}
    items.each do |item|
      if vendors_that_sell(item).map {|vendor| vendor.check_stock(item)}.sum > 50
        overstocked << item
      end
    end
    overstocked
  end

  def total_inventory
    list_items.each_with_object({}) do |item, inventory|
      
    end
  end
end
