class Customer < ApplicationRecord
  belongs_to :tenant
  belongs_to :recruiter, class_name: 'User', optional: true
  validates :name, presence: true
end
