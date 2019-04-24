class Rollover < ActiveRecord::Base
    belongs_to :user
    belongs_to :institution

    accepts_nested_attributes_for :institution, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true

    scope :order_by_amount, -> {order(:amount)}


end