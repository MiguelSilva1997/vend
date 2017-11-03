require "rails_helper"

describe "when a visitor visits machine show page" do
  it "they see the machines snacks and price" do
    owner = Owner.create(name: "Sam's Snacks")
    snacks = Snack.create(name: "Doritos", price: 2.50)
    snacks_1 = Snack.create(name: "Cheetos", price: 3.50)
    snacks_2 = Snack.create(name: "Gum", price: 1.00)
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snack_ids: [snacks.id, snacks_1.id, snacks_2.id])

    visit machine_path(dons)

    expect(current_path).to eq("/machines/#{dons.id}")
    expect(page).to have_content("Doritos")
    expect(page).to have_content(2.50)
    expect(page).to have_content("Cheetos")
    expect(page).to have_content(3.50)
    expect(page).to have_content("Gum")
    expect(page).to have_content(1.00)
    expect(page).to have_content(2.33)
  end

end
