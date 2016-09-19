require "rails_helper"

RSpec.describe Category, type: :model do
  it "has a name" do
    category = Category.new(name: "Things")

    expect(category.name).to eq("Things")
  end

  it "creates a slug from its name" do
    category = Category.new(name: "Awesome Things")

    expect(category.slug).to eq("awesome-things")
    expect(category.to_param).to eq("awesome-things")
  end
end
