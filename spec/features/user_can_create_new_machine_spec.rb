require 'rails_helper'

RSpec.feature "user can create a new machine" do
  scenario "from main page" do
    owner = Owner.new(name: "Geoffery")
    machine = Machine.new(owner: owner, name: "R2D2", location: "Tatooine")

    visit root_path
    click_on("Create New Machine")
    fill_in "machine[owner]", with: owner.name
    fill_in "machine[name]", with: machine.name
    fill_in "machine[location]", with: machine.location
    within("p") do
      click_on("Create")
    end

    expect(current_path).to eq(machine_path(Machine.find_by(name: machine.name)))
    expect(page).to have_content(owner.name)
    expect(page).to have_content(machine.name)
    expect(page).to have_content(machine.location)
  end
end
