class Institution < ApplicationRecord
    has_many :rollovers
    has_many :users, through: :rollovers

    validates :name, presence: true, uniqueness: true

    scope :order_by_name, -> {order(:name)}
    
end

  