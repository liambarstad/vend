require 'rails_helper'

RSpec.feature "user can view specific owner" do
  scenario "from owners index" do
    owner1 = Owner.create(name: "Harold")
    owner2 = Owner.create(name: "Joe")
    machine1 = owner1.machines.create(name: "Bob", location: "Mississipi")
    machine2 = owner2.machines.create(name: "C3PO", location: "Alabama")

    visit owners_path
    click_on(owner1.name)

    expect(current_path).to eq(owner_path(owner1))
    expect(page).to have_content(owner1.name)
    expect(page).to have_content(machine1.name)
    expect(page).to have_content(machine1.location)
  end
end
