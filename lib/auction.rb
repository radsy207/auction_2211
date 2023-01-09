require 'date'

class Auction
  attr_reader :items,
              :date
  
  def initialize
    @items = []
    @date = Date.today.to_s
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
    bidders_arr = []
    @items.each do |item|
      item.bids.each_key do |attendee|
        bidders_arr << attendee
      end
    end
    bidders_arr.uniq
  end

  def bidder_items(bidder)
    items_for_bidder = []
    @items.each do |item|
      item.bids.each_key do |attendee|
        items_for_bidder << item if attendee == bidder
      end
    end
    items_for_bidder
  end

  def bidder_info
    hash = Hash.new {|hash, key| hash[key] = {}}  

    bidders.each do |bidder|
      hash[bidder]
      hash[bidder][:budget] = bidder.budget.delete("$").to_i
      hash[bidder][:items] = bidder_items(bidder)
    end
    hash
  end
end