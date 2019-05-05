require "rails_helper"

RSpec.describe "comedians index page", type: :feature do
  # USER STORY 1

  it "user can see all comedians" do
    andy = Comedian.create(name: "Andy Kauffman", age: 35, city: "New York, NY", img_url: "andy.png")
    brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")

    visit "/comedians"

    expect(page).to have_content(andy.name)
    expect(page).to have_content("(#{andy.age} years old) #{andy.city}")
    expect(page).to have_content(brian.name)
    expect(page).to have_content("(#{brian.age} years old) #{brian.city}")
  end

  # USER STORY 2

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

  # USER STORY 3

  it "user can see comedian images" do
    andy = Comedian.create(name: "Andy Kauffman", age: 35, city: "New York, NY", img_url: "andy.png")
    brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")

    visit "/comedians"

    expect(page).to have_css("img[src*='andy.png']")
    expect(page).to have_css("img[src*='brian.png']")
  end

  # USER STORY 4

  it "user can see comedians by age param" do
    andy = Comedian.create(name: "Andy Kauffman", age: 34, city: "New York, NY", img_url: "andy.png")
    brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")

    visit '/comedians?age=34'

    expect(page).to have_no_content(brian.name)
    expect(page).to have_content(andy.name)
    expect(page).to have_content("(#{andy.age} years old) #{andy.city}")
    expect(page).to have_css("img[src*='andy.png']")
  end

  # USER STORY 5

  it "user can see TV special count" do
    andy = Comedian.new(name: "Andy Kauffman", age: 35, city: "New York, NY", img_url: "andy.png")
    andy.save
    special_1 = Special.new(name: "Man On The Moon", run_time: 60)
    special_1.comedian = andy
    special_1.save
    special_2 = Special.new(name: "Andy Live in NY", run_time: 50)
    special_2.comedian = andy
    special_2.save

    visit '/comedians'

    expect(page).to have_content(andy.special_count)
  end

  
end
