class User < ActiveRecord::Base
    has_secure_password
  has_many :rollovers
  has_many :institutions, through: :rollovers

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, :uniqueness => { case_sensitive: false }
  validates :email, presence: true
  


end