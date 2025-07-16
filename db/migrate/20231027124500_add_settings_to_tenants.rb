class AddSettingsToTenants < ActiveRecord::Migration[7.0]
  def change
    add_column :tenants, :timezone, :string, default: 'UTC'
    add_column :tenants, :currency, :string, default: 'USD'
    add_column :tenants, :language, :string, default: 'en'
    add_column :tenants, :multi_uom, :boolean, default: false
    add_column :tenants, :payroll, :boolean, default: true
    add_column :tenants, :commissions, :boolean, default: false
    add_column :tenants, :consignment, :boolean, default: false
    add_column :tenants, :samples, :boolean, default: false
  end
end
