require "rails_helper"

RSpect.feature "Users can see category items" do
  scenario "page displays items in category" do
    #Given that category exist
    #And items are assigned
    #As a user
    #I visit '/category_name'
    #I see the name of the category
    #I also see all the items that belongs to that category
    category = Category.create(name: "grocery")
    category.items.create(title: "Banana",
                          description: "Wholesome Yellow Goodness",
                          price: 19,
                          image_path: "http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg")

    visit "/grocery"

    expect(page).to have_content("Grocery")
    expect(page).to have_content("Banana")
  end
end
# user
