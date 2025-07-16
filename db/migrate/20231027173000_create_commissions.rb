class CreateCommissions < ActiveRecord::Migration[7.0]
  def change
    create_table :commissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end

    add_reference :customers, :recruiter, foreign_key: { to_table: :users }
  end
end
