require 'rails_helper' 
RSpec.describe Restaurant do 
    it "not created name nil " do
        expect(Restaurant.new(name: nil)).to be_valid
    end
    it "not created if name exists" do
    Restaurant.create!(name: 'Outback')
    restaurant = Restaurant.new(name: 'Outback')
    restaurant.should_not be_valid
    expect(restaurant.errors[:name]).should include('name restaurant exists') 
    end

end