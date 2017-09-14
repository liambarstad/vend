require 'rails_helper'

RSpec.feature "user can delete an owner" do
  scenario "from main page" do
    owner = Owner.create(name: "Farnsworth")

    visit owners_path
    click_on("Delete Owner", match: :first)
    expect(current_path).to eq(owners_path)
    expect(page).to_not have_content(owner.name)
  end

  scenario "from show page" do
    owner = Owner.create(name: "Farnsworth")

    visit owner_path(owner)
    click_on("Delete Owner")
    expect(current_path).to eq(owners_path)
    expect(page).to_not have_content(owner.name)
  end
end
