class Auction
  attr_reader :items,
              :item_names
  
  def initialize
    @items = []
    @item_names = []
  end

  def add_item(item)
    @items.push(item)
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end
end