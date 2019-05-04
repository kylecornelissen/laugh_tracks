require "rails_helper"

RSpec.describe "comedians index page", type: :feature do

  # As a user,
  # when I visit '/comedians'
  # Then I see a list of comedians with name, age, and city

  it "user can see all comedians" do
    andy = Comedian.create(name: "Andy Kauffman", age: 35, city: "New York, NY", img_url: "andy.png")
    brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")

    visit "/comedians"

    expect(page).to have_content(andy.name)
    expect(page).to have_content("(#{andy.age} years old) #{andy.city}")
    expect(page).to have_content(brian.name)
    expect(page).to have_content("(#{brian.age} years old) #{brian.city}")
  end

  # As a visitor
  # When I visit `/comedians`
  # Then I also see a list of each comedian's TV specials, including

  it "user can see comedian specials" do
    # used multiple ways to create objects for future reference (.new is industry preferred)
    andy = Comedian.new(name: "Andy Kauffman", age: 35, city: "New York, NY", img_url: "andy.png")
    andy.save
    brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")
    special_1 = Special.new(name: "Andy Live in NY", run_time: 50)
    special_1.comedian = andy
    special_1.save
    special_2 = Special.create(name: "Kauffman Live", run_time: 55, comedian_id: andy.id)
    special_3 = Special.create(name: "Brian Live in LA", run_time: 70, comedian_id: brian.id)

    visit "/comedians"

    expect(page).to have_content(special_1.name)
    expect(page).to have_content("(#{special_1.run_time} minutes)")
    expect(page).to have_content(special_2.name)
    expect(page).to have_content("(#{special_2.run_time} minutes)")
    expect(page).to have_content(special_3.name)
    expect(page).to have_content("(#{special_3.run_time} minutes)")

  end

  # As a visitor
  # When I visit `/comedians`
  # I see a thumbnail image for each comedian

  it "user can see comedian images" do
    andy = Comedian.create(name: "Andy Kauffman", age: 35, city: "New York, NY", img_url: "andy.png")
    brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")

    visit "/comedians"

    expect(page).to have_css("img[src*='andy.png']")
  end
end
