class Institution < ApplicationRecord
    has_many :rollovers
    has_many :users, through: :rollovers
end

  