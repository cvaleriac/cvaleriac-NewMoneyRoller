class Institution < ApplicationRecord
    has_many :rollovers
    has_many :users, through: :rollovers

    scope :order_by_name, -> {order(:name)}
end

  