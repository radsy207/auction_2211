require './lib/item'

RSpec.describe Item do
  let(:item1) Item.new('Chalkware Piggy Bank')
  let(:item2) Item.new('Bamboo Picture Frame')

  describe "#initialize" do
    it "exists" do
      expect(item1).to be(Item)
    end
  end
end