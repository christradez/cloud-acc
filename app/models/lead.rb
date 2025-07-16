class Lead < ApplicationRecord
  belongs_to :tenant
  has_many :opportunities, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :tenant_id }
end
