class Disk < ApplicationRecord

    acts_as_paranoid

    validates :name, presence: { message: 'Insira o nome do prato' }
    validates :price, presence: { message: 'Insira o preço do prato' }
    
    belongs_to :restaurant, -> {with_deleted}
    
    def self.search(query)
        where("name like ?", "%#{query}%") 
    end

end
