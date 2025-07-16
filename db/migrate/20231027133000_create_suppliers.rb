class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :tax_id
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
