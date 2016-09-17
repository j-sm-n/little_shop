require "rails_helper"

RSpec.feature "Users can see category items" do
  scenario "page displays items in category" do
    # Given that category exist
    # And items are assigned
    # As a user
    # I visit '/category_name'
    # I see the name of the category
    # I also see all the items that belongs to that category
    category = Category.create(name: "grocery")
    category.items.create(title: "Banana",
                          description: "Wholesome Yellow Goodness",
                          price: 19,
                          image_path: "http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg")

    visit "/grocery"

    expect(page).to have_content("Grocery")
    expect(page).to have_content("Banana")
  end

  scenario "page displays items in category" do
    # Given that category exist
    # And items are assigned
    # As a user
    # I visit '/category_name'
    # I see the name of the category
    # I also see all the items that belongs ONLY to that category
    category_1 = Category.create(name: "grocery")
    category_1.items.create(title: "Banana",
                            description: "Wholesome Yellow Goodness",
                            price: 19,
                            image_path: "http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg")

    category_2 = Category.create(name: "beverages")
    category_2.items.create(title: "Black Tea",
                            description: "This black tea is from the freshest plant you can ever imagine",
                            price: 100,
                            image_path: " http://kingofwallpapers.com/tea/tea-006.jpg")

    visit "/grocery"

    expect(page).to have_content("Grocery")
    expect(page).to have_content("Banana")

    expect(page).to_not have_content("Black Tea")
  end
end
