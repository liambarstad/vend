require 'rails_helper'

RSpec.feature "user can see specific snack page" do
  scenario "from machine show page" do
    owner = Owner.create(name: "Phil")
    machine = Machine.create(name: "this one", location: "somehwere", owner: owner)
    snack1 = Snack.create(name: "Cheetos", price: 4.00)
    snack2 = Snack.create(name: "Figs", price: 10.00)
    snack_machine_1 = SnackMachine.create(machine: machine, snack: snack1)
    snack_machine_2 = SnackMachine.create(machine: machine, snack: snack2)

    visit machine_path(machine)
    click_on(snack1.name)

    expect(current_path).to eq(snack_path(snack1))
    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(machine.location)
    expect(page).to have_content(machine.average_price)
    expect(page).to have_content("2 kinds of snacks")
  end
end
