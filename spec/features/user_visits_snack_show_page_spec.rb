require "rails_helper"

describe "when user visit snack show page " do
  it "they see the snack and price" do
    owner = Owner.create(name: "Sam's Snacks")
    snacks = Snack.create(name: "Doritos", price: 2.50)
    snacks_1 = Snack.create(name: "Cheetos", price: 3.50)
    snacks_2 = Snack.create(name: "Gum", price: 1.00)
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snack_ids: [snacks.id, snacks_1.id, snacks_2.id])
    turing = owner.machines.create(location: "Turing Basement", snack_ids: [snacks.id, snacks_1.id])

    visit snack_path(snacks)

    expect(current_path).to eq("/snacks/#{snacks.id}")
    expect(page).to have_content("Doritos")
    expect(page).to have_content(2.50)
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
    expect(page).to have_content(2.33)
  end
end
