class UserSerializer < ActiveModel::Serializer
  attributes :uuid, :username, :first_name, :last_name, :email, :phone_number
end
