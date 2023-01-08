class Item
  attr_reader :name,
              :bids
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    bids[attendee] = bid
  end

  def list_of_bids_by_price
    @bids.map do |bid|
      bid.last
    end
  end

  def current_high_bid
    list_of_bids_by_price.max
  end
end