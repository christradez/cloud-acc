class Commission < ApplicationRecord
  belongs_to :user
  belongs_to :invoice
  belongs_to :tenant
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
