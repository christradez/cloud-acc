class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :sku
      t.string :category
      t.string :brand
      t.references :tax_code, null: false, foreign_key: true
      t.string :base_uom
      t.integer :quantity, default: 0
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
