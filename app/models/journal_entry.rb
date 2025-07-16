class JournalEntry < ApplicationRecord
  belongs_to :tenant
  has_many :journal_entry_items, dependent: :destroy
  accepts_nested_attributes_for :journal_entry_items, allow_destroy: true
  validates :date, presence: true
end
