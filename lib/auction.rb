class Auction
  attr_reader :items
  
  def initialize
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.select do |item|
      item.bids.empty?
    end
  end

  def potential_revenue
    potential_revenue = 0
    @items.each do |item|
      potential_revenue += item.current_high_bid if !item.bids.empty?
    end
    potential_revenue
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.each_key do |attendee|
        # require 'pry'; binding.pry
        bidders << attendee.name
      end
    end
    bidders.uniq
  end

  
end