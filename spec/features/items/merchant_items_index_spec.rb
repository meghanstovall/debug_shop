require 'rails_helper'

RSpec.describe "Merchant Items Index Page" do
  describe "When I visit the merchant items page" do
    before(:each) do
      @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @brian = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)
      @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", active_inactive: true, inventory: 12)
      @chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", active_inactive: true, inventory: 5)
      @shifter = @meg.items.create(name: "Shimano Shifters", description: "It'll always shift!", price: 180, image: "https://images-na.ssl-images-amazon.com/images/I/4142WWbN64L._SX466_.jpg", active_inactive: false, inventory: 2)
      @pull_toy = @brian.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", active_inactive: true, inventory: 32)
      @dog_bone = @brian.items.create(name: "Dog Bone", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active_inactive: true, inventory: 21)
    end

    it 'shows me a list of that merchants items' do
      visit "/merchants/#{@meg.id}/items"

      expect(page).to have_content(@tire.name)
      expect(page).to have_content(@tire.price)
      expect(page).to have_content(@tire.active_inactive)
      expect(page).to have_content(@tire.inventory)
      expect(page).to have_content(@chain.name)
      expect(page).to have_content(@chain.price)
      expect(page).to have_content(@chain.active_inactive)
      expect(page).to have_content(@chain.inventory)
      expect(page).to have_content(@shifter.name)
      expect(page).to have_content(@shifter.price)
      expect(page).to have_content(@shifter.active_inactive)
      expect(page).to have_content(@shifter.inventory)
      expect(page).to_not have_content(@pull_toy.name)
    end

    it 'has a link to add a new item for that merchant' do

      visit "/merchants/#{@meg.id}/items"

      click_on "Add New Item"

      expect(current_path).to eq("/merchants/#{@meg.id}/items/new")
    end
  end
end
