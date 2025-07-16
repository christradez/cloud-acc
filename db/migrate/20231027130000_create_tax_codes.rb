class CreateTaxCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :tax_codes do |t|
      t.string :name
      t.decimal :rate, precision: 8, scale: 2
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
