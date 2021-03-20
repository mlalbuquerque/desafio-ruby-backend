class Api::V1::StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner
end
