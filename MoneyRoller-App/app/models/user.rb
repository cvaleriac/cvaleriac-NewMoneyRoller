class User < ActiveRecord::Base
    has_secure_password
  has_many :rollovers
  has_many :institutions, through: :rollovers

  validates :username, :email, presence: true
  validates :username, uniqueness: true



end