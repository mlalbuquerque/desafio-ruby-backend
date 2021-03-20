class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :provider
end
