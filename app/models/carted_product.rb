class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :order

  validates :status, inclusion: { in: ["carted", "purchased", "removed"] }
end
