require 'rails_helper'

RSpec.describe "Items Index Page" do
  describe "When I visit the items index page" do
    before(:each) do
      @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @brian = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)
      @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", active_inactive: true, inventory: 12)
      @chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", active_inactive: true, inventory: 5)
      @shifter = @meg.items.create(name: "Shimano Shifters", description: "It'll always shift!", price: 180, image: "https://images-na.ssl-images-amazon.com/images/I/4142WWbN64L._SX466_.jpg", active_inactive: false, inventory: 2)
      @pull_toy = @brian.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", active_inactive: true, inventory: 32)
      @dog_bone = @brian.items.create(name: "Dog Bone", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active_inactive: true, inventory: 21)
    end

    it "I can see a list of all of the items "do

      visit '/items'

      within "#item-#{@chain.id}" do
        expect(page).to have_content("Chain")
        expect(page).to have_content("It'll never break!")
        expect(page).to have_content("Price: $50.00")
        expect(page).to have_content("Inventory: 5")
        expect(page).to have_content("Active")
        expect(page).to have_link("Meg's Bike Shop")
      end

      within "#item-#{@tire.id}" do
        expect(page).to have_content("Gatorskins")
        expect(page).to have_content("They'll never pop!")
        expect(page).to have_content("Price: $100.00")
        expect(page).to have_content("Inventory: 12")
        expect(page).to have_content("Active")
        expect(page).to have_link("Meg's Bike Shop")
      end

      within "#item-#{@shifter.id}" do
        expect(page).to have_content("Shimano Shifters")
        expect(page).to have_content("It'll always shift!")
        expect(page).to have_content("Price: $180.00")
        expect(page).to have_content("Inventory: 2")
        expect(page).to have_content("Inactive")
        expect(page).to have_link("Meg's Bike Shop")
      end

      within "#item-#{@pull_toy.id}" do
        expect(page).to have_content("Pull Toy")
        expect(page).to have_content("Great pull toy!")
        expect(page).to have_content("Price: $10.00")
        expect(page).to have_content("Inventory: 32")
        expect(page).to have_content("Active")
        expect(page).to have_link("Brian's Dog Shop")
      end
    end
  end
end
