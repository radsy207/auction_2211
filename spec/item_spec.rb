require './lib/item'
require './attendee'

RSpec.describe Item do
  let(:item1) {Item.new('Chalkware Piggy Bank')}
  let(:item2) {Item.new('Bamboo Picture Frame')}
  let(:attendee1) {Attendee.new(name: 'Megan', budget: '$50')}
  let(:attendee2) {Attendee.new(name: 'Bob', budget: '$75')}

  describe "#initialize" do
    it "exists" do
      expect(item1).to be_an_instance_of(Item)
    end

    it 'has a name' do
      expect(item1.name).to eq('Chalkware Piggy Bank')
    end
  end

  describe 'add_bid' do
    it 'adds bids to bids hash' do
      item1.bids
      expect(item1.bids).to eq({})
      expected_hash = {
        attendee2 => 20,
        attendee1 => 22
      }
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
    end
  end

  describe '#current_high_bid' do
    it 'states the highest bid integer' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.current_high_bid).to eq(22)
    end
  end

  
end