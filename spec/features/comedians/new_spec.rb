require "rails_helper"

RSpec.describe "comedians new page", type: :feature do
  # USER STORY 6

  it "user can create new comedians" do
    comedian_name = "Rodney Dangerfield"
    age = 83
    city = "Deer Park, NY"
    img_url = "rodney.png"

    visit '/comedians/new'

    fill_in "comedian[name]", with: comedian_name
    fill_in "comedian[age]", with: age
    fill_in "comedian[city]", with: city
    fill_in "comedian[img_url]", with: img_url
    click_on "Add Comedian"

    expect(page).to have_content(comedian_name)
    expect(page).to have_content(age)
    expect(page).to have_content(city)
    expect(page).to have_css("img[src*='rodney.png']")
  end
end
