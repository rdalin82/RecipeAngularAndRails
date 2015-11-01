require 'spec_helper.rb'

feature "Looking up recipes", js: true do 
	before do 
		Item.create!(name: 'Baked Potato w/ Cheese')
		Item.create!(name: 'Garlic Mashed Potatoes')
		Item.create!(name: 'Potatoes Au Gratin' )
		Item.create!(name: 'Baked Brussel Sprouts')
	end
	scenario "finding recipes" do 
		visit '/'
		fill_in "keywords", with: "baked" 
		click_on "Search" 

		expect(page).to have_content("Baked Potato")
		expect(page).to have_content("Baked Brussel Sprouts")
	end 
end 