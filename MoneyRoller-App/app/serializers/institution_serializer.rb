class InstitutionSerializer < ActiveModel::Serializer
  attributes :id, :name, :address

  has_many :rollovers
end
