class Account < ApplicationRecord
  belongs_to :tenant
  has_many :journal_entry_items
  validates :name, presence: true
  validates :account_type, presence: true

  def balance
    debits = journal_entry_items.where(entry_type: 'debit').sum(:amount)
    credits = journal_entry_items.where(entry_type: 'credit').sum(:amount)
    debits - credits
  end
end
