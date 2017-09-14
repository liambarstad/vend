require 'rails_helper'

RSpec.feature "user can update owner" do
  scenario "from owner page" do
    owner = Owner.create(name: "Billy")

    visit(owner_path(owner))
    click_on("Edit Owner")
    fill_in "owner[name]", with: "Joe Bob IV"
    click_on("Update")

    expect(current_path).to eq(owner_path(owner))
    expect(page).to_not have_content("Billy")
    expect(page).to have_content("Joe Bob IV")
  end
end
