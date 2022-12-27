class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :number_of_items, :price
end
