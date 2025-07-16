class Invoice < ApplicationRecord
  belongs_to :tenant
  belongs_to :customer
  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, allow_destroy: true
  validates :date, presence: true
  validates :due_date, presence: true
end
