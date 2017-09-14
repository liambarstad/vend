require 'rails_helper'

RSpec.feature "user can delete a machine" do
  scenario "from machines index page" do
    owner = Owner.create(name: "Moses")
    machine = Machine.create(name: "That one on the corner", location: "In Boston", owner: owner)

    visit owner_machines_path(owner)
    click_on("Delete", match: :first)

    expect(current_path).to eq(owner_machines_path(owner))
    expect(page).to_not have_content(machine.name)
  end

  scenario "from show page" do
    owner = Owner.create(name: "Moses")
    machine = Machine.create(name: "That one on the corner", location: "In Boston", owner: owner)

    visit machine_path(machine)
    click_on("Delete", match: :first)

    expect(current_path).to eq(owner_machines_path(owner))
    expect(page).to_not have_content(machine.name)
  end
end
