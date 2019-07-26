class RolloverSerializer < ActiveModel::Serializer
  attributes :id, :amount, :origin
  belongs_to :user, optional: true
  belongs_to :institution, optional: true
end
