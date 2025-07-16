class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :customer_type
      t.string :tax_id
      t.string :payment_terms
      t.string :currency
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
