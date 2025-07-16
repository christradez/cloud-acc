class CreateCrmTables < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :status
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end

    create_table :opportunities do |t|
      t.string :name
      t.references :lead, null: false, foreign_key: true
      t.string :stage
      t.decimal :amount, precision: 10, scale: 2
      t.date :close_date
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end

    create_table :pipelines do |t|
      t.string :name
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
