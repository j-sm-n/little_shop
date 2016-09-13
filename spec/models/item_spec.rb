require 'rails_helper'

RSpec.describe Item, type: :model do
  context "with sufficient attributes" do
    it "has the right attributes" do
      item = Item.create(title: "Dead Dove",
                         description: "I don't know what I expected",
                         long_description: "Sometimes you have to return"\
                         "a dead dove. You really don't want your brother, or"\
                         "anyone else eating it. This is an Arrested Development"\
                         "joke, in case you missed that",
                         price: 8,
                         image_path: "https://i.ytimg.com/vi/nmLqs8qkP_Y/hqdefault.jpg")

      expect(item).to be_valid
      expect(item.title).to eq("Dead Dove")
      expect(item.description).to eq("I don't know what I expected")
      expect(item.long_description).to include("Arrested Development")
      expect(item.price).to eq(8)
      expect(item.image_path).to eq("https://i.ytimg.com/vi/nmLqs8qkP_Y/hqdefault.jpg")
    end

    it "doesn't require long description" do
      item = Item.create(title: "Dead Dove",
                         description: "I don't know what I expected",
                         price: 8,
                         image_path: "https://i.ytimg.com/vi/nmLqs8qkP_Y/hqdefault.jpg")
      expect(item).to be_valid
    end
  end

  context "with insufficient attributes" do
    it "requires title" do
      item = Item.create(description: "I don't know what I expected",
                         price: 8,
                         image_path: "https://i.ytimg.com/vi/nmLqs8qkP_Y/hqdefault.jpg")

      expect(item).to be_invalid
    end

    it "requires description" do
      item = Item.create(title: "Dead Dove",
                         price: 8,
                         image_path: "https://i.ytimg.com/vi/nmLqs8qkP_Y/hqdefault.jpg")

      expect(item).to be_invalid
    end

    it "requires price" do
      item = Item.create(title: "Dead Dove",
                         description: "I don't know what I expected",
                         image_path: "https://i.ytimg.com/vi/nmLqs8qkP_Y/hqdefault.jpg")

      expect(item).to be_invalid
    end

    it "requires image" do
      item = Item.create(title: "Dead Dove",
                         description: "I don't know what I expected",
                         price: 8)

      expect(item).to be_invalid
    end
  end
end
