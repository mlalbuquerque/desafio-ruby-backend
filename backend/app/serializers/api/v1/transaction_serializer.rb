class Api::V1::TransactionSerializer < ActiveModel::Serializer
  attributes :id, , :date, :value, :cpf, :card_number, :hour, :transaction_type_id, :store_id
end
