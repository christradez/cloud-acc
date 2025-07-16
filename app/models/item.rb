class Item < ApplicationRecord
  belongs_to :tenant
  belongs_to :tax_code
  validates :name, presence: true
  validates :base_uom, presence: true
end
