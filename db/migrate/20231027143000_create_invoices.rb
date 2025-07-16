class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :status
      t.date :date
      t.date :due_date
      t.decimal :total, precision: 10, scale: 2
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end

    create_table :invoice_items do |t|
      t.references :invoice, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.timestamps
    end
  end
end
