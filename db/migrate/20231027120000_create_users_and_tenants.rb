class CreateUsersAndTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :subdomain
      t.timestamps
    end

    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
