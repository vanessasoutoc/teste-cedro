class RestaurantSerializer < ActiveModel::Serializer
    #acts_as_paranoid
    attributes :id, :name, :deleted_at
end
