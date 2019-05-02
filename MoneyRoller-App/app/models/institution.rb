class Institution < ApplicationRecord
    has_many :rollovers
    has_many :users, through: :rollovers

    validates :name, presence: true
    validates :address, presence: true

    scope :order_by_name, -> {order(:name)}
    
end

  