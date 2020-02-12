require 'rails_helper'

RSpec.describe "Merchant Items Index Page" do
  describe "When I visit the merchant items page" do
    before(:each) do
      @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @brian = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)
      @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", active_inactive: true, inventory: 12)
      @chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", active_inactive: true, inventory: 5)
      @shifter = @meg.items.create(name: "Shimano Shifters", description: "It'll always shift!", price: 180, image: "https://images-na.ssl-images-amazon.com/images/I/4142WWbN64L._SX466_.jpg", active_inactive: false, inventory: 2)
    end

    it 'has a link to add a new item for that merchant' do

      visit "merchants/#{@meg.id}/items"

      click_on "Add New Item"

      fill_in 'Name', with: "Chamois Buttr"
      fill_in 'Price', with: 18
      fill_in 'Description', with: "No more chaffin'!"
      fill_in 'Image', with: "https://images-na.ssl-images-amazon.com/images/I/51HMpDXItgL._SX569_.jpg"
      fill_in 'Inventory', with: 25

      click_button "Create Item"

      created_item = Item.last
      
      expect(current_path).to eq("/merchants/#{@meg.id}/items")
      expect(page).to have_content(created_item.name)
      expect(page).to have_content(created_item.price)
      expect(page).to have_content(created_item.description)
      expect(page).to have_content(created_item.inventory)
      expect(created_item.active_inactive).to be(true)
    end
  end
end
