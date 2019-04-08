class User < ActiveRecord::Base
    has_secure_password
  has_many :rollovers
  has_many :institutions, through: :rollovers

  validates :username, :password, presence: true
  validates :username, uniqueness: true

  def rollover_incoming
    rollover_type
  end

  def rollover_outgoing
    rollover_type
  end

end