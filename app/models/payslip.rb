class Payslip < ApplicationRecord
  belongs_to :employee
  belongs_to :tenant
  validates :date, presence: true
end
