class Bill < ApplicationRecord
  belongs_to :tenant
  belongs_to :supplier
  has_many :bill_items, dependent: :destroy
  accepts_nested_attributes_for :bill_items, allow_destroy: true
  validates :date, presence: true
  validates :due_date, presence: true
end
