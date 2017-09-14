require 'rails_helper'

RSpec.feature "user can update a machine" do
  scenario "from show page" do
    owner = Owner.create(name: "Dennis")
    machine = Machine.create(name: "Terminator", location: "Wherever Sarah Connor's at", owner: owner)

    visit machine_path(machine)
    click_on("Edit")

    expect(current_path).to eq(edit_machine_path(machine))
    fill_in "machine[owner]", with: "George"
    fill_in "machine[name]", with: "Terminator"
    fill_in "machine[location]", with: "Painting Pretty Pictures"
    click_on("Update")

    expect(current_path).to eq(machine_path(machine))
    expect(Owner.find_by(name: "George")).to be_truthy
    expect(page).to have_content("George")
    expect(page).to have_content(machine.name)
    expect(page).to have_content("Painting Pretty Pictures")
  end

  scenario "from owner page" do

  end
end
