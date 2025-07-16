class JournalEntryItem < ApplicationRecord
  belongs_to :journal_entry
  belongs_to :account
  validates :entry_type, presence: true, inclusion: { in: %w(debit credit) }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
