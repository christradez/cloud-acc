class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_entries do |t|
      t.date :date
      t.string :description
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end

    create_table :journal_entry_items do |t|
      t.references :journal_entry, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.string :entry_type
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
