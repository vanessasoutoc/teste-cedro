class DiskSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :price
  has_one :restaurant
end
