class Restaurant < ApplicationRecord
    acts_as_paranoid
    has_many :disks
end
