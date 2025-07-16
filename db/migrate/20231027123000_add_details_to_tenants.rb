class AddDetailsToTenants < ActiveRecord::Migration[7.0]
  def change
    add_column :tenants, :address, :string
    add_column :tenants, :contact, :string
    add_column :tenants, :logo, :string
  end
end
