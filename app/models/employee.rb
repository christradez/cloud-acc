class Employee < ApplicationRecord
  belongs_to :tenant
  has_many :payslips, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :tenant_id }
end
