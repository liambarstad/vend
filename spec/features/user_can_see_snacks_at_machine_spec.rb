require 'rails_helper'

RSpec.feature "user can see snacks at vending machine" do
  scenario "at show page" do
    owner = Owner.create(name: "Phil")
    machine = Machine.create(name: "this one", location: "somehwere", owner: owner)
    snack1 = Snack.create(name: "Cheetos", price: 4.00)
    snack2 = Snack.create(name: "Figs", price: 10.00)
    snack_machine_1 = SnackMachine.create(machine: machine, snack: snack1)
    snack_machine_2 = SnackMachine.create(machine: machine, snack: snack2)

    visit machine_path(machine)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
  end
end
