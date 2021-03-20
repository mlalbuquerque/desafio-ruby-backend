class Api::V1::TransactionTypeSerializer < ActiveModel::Serializer
  attributes :id, :description, :nature, :signal
end
