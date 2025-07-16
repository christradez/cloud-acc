class User < ApplicationRecord
  belongs_to :tenant
  has_secure_password
  validates :email, presence: true, uniqueness: { scope: :tenant_id }

  has_many :commissions
  has_many :recruited_customers, class_name: 'Customer', foreign_key: 'recruiter_id'
end
