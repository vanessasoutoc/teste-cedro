require 'rails_helper' 
RSpec.describe Disk do 
    it "not created if name and/or price is nil" do
        disk = Disk.create(restaurant_id: 1, name: nil, price: nil)
        expect(disk).to be_valid
    end
    it "not created if restaurant_id is nil" do
        disk = Disk.create(restaurant_id: nil, name: "File de Frango Teste", price: nil)
        expect(disk).to be_valid
    end
end