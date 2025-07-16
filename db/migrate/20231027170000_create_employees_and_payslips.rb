class CreateEmployeesAndPayslips < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.decimal :salary, precision: 10, scale: 2
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end

    create_table :payslips do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :date
      t.decimal :gross_salary, precision: 10, scale: 2
      t.decimal :deductions, precision: 10, scale: 2
      t.decimal :net_salary, precision: 10, scale: 2
      t.references :tenant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
