require 'rspec'
require './lib/item'
require './lib/vendor'

describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'exists and has readable attributes' do
    expect(@item1).to be_an_instance_of Item
    expect(@vendor).to be_an_instance_of Vendor
    expect(@vendor.name).to eq "Rocky Mountain Fresh"
    expect(@vendor.inventory).to be_an_instance_of Hash
    expect(@vendor.check_stock(@item1)).to eq 0
    @vendor.stock(@item1, 30)
    expected_inventory = {@item1 => 30}
    expect(@vendor.inventory).to eq expected_inventory
    expect(@vendor.check_stock(@item1)).to eq 30
    @vendor.stock(@item1, 25)
    expect(@vendor.check_stock(@item1)).to eq 55
    @vendor.stock(@item2, 12)
    expected_inventory = {@item1 => 55, @item2 => 12}
    expect(@vendor.inventory).to eq expected_inventory
  end
end
