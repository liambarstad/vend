require 'rails_helper'

RSpec.feature "user can create a new owner" do
  scenario "from main page" do
    owner = Owner.new(name: "Willis")

    visit(root_path)
    click_on("Create New Owner")
    fill_in "owner[name]", with: owner.name
    within("p") do
      click_on("Create")
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content("New Owner #{owner.name} Created")
  end
end
