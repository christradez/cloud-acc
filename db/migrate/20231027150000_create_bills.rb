class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :status
      t.date :date
      t.date :due_date
      t.decimal :total, precision: 10, scale: 2
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end

    create_table :bill_items do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.timestamps
    end
  end
end
