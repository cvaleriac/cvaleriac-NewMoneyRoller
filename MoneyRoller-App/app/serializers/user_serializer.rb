class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :rollovers
  has_many :institutions, through: :rollovers
end
