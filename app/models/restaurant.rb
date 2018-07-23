class Restaurant < ApplicationRecord
    
    acts_as_paranoid
    
    validates :name, presence: { message: 'Insira o nome do restaurante' }, uniqueness: { message: 'Restaurante já existe.' }
    
    has_many :disks, dependent: :destroy
    
end
