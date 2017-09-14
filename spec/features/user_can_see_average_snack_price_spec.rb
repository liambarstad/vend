require 'rails_helper'

RSpec.feature "user can see average snack price" do
  scenario "from show page" do
    owner = Owner.create(name: "Phil")
    machine = Machine.create(name: "this one", location: "somehwere", owner: owner)
    snack1 = Snack.create(name: "Cheetos", price: 4.00)
    snack2 = Snack.create(name: "Figs", price: 10.00)
    snack_machine_1 = SnackMachine.create(machine: machine, snack: snack1)
    snack_machine_2 = SnackMachine.create(machine: machine, snack: snack2)

    visit machine_path(machine)

    expect(page).to have_content("7.0")
  end
end
