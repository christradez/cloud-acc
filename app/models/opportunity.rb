class Opportunity < ApplicationRecord
  belongs_to :tenant
  belongs_to :lead
  validates :name, presence: true
end
