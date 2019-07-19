class InstitutionSerializer < ActiveModel::Serializer
  attributes :id, :name, :address

  has_many :rollovers
  has_many :users
end
