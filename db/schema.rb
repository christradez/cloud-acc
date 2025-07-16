# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2023_10_27_180000) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "account_type"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_accounts_on_tenant_id"
  end

  create_table "bill_items", force: :cascade do |t|
    t.integer "bill_id", null: false
    t.integer "item_id", null: false
    t.integer "quantity"
    t.decimal "unit_price", precision: 10, scale: 2
    t.decimal "total", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_items_on_bill_id"
    t.index ["item_id"], name: "index_bill_items_on_item_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "supplier_id", null: false
    t.string "status"
    t.date "date"
    t.date "due_date"
    t.decimal "total", precision: 10, scale: 2
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_bills_on_supplier_id"
    t.index ["tenant_id"], name: "index_bills_on_tenant_id"
  end

  create_table "commissions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "invoice_id", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_commissions_on_invoice_id"
    t.index ["tenant_id"], name: "index_commissions_on_tenant_id"
    t.index ["user_id"], name: "index_commissions_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "customer_type"
    t.string "tax_id"
    t.string "payment_terms"
    t.string "currency"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recruiter_id"
    t.index ["recruiter_id"], name: "index_customers_on_recruiter_id"
    t.index ["tenant_id"], name: "index_customers_on_tenant_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.decimal "salary", precision: 10, scale: 2
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_employees_on_tenant_id"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.integer "invoice_id", null: false
    t.integer "item_id", null: false
    t.integer "quantity"
    t.decimal "unit_price", precision: 10, scale: 2
    t.decimal "total", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["item_id"], name: "index_invoice_items_on_item_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "status"
    t.date "date"
    t.date "due_date"
    t.decimal "total", precision: 10, scale: 2
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["tenant_id"], name: "index_invoices_on_tenant_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.string "category"
    t.string "brand"
    t.integer "tax_code_id", null: false
    t.string "base_uom"
    t.integer "quantity", default: 0
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tax_code_id"], name: "index_items_on_tax_code_id"
    t.index ["tenant_id"], name: "index_items_on_tenant_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_journal_entries_on_tenant_id"
  end

  create_table "journal_entry_items", force: :cascade do |t|
    t.integer "journal_entry_id", null: false
    t.integer "account_id", null: false
    t.string "entry_type"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_journal_entry_items_on_account_id"
    t.index ["journal_entry_id"], name: "index_journal_entry_items_on_journal_entry_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "status"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_leads_on_tenant_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "name"
    t.integer "lead_id", null: false
    t.string "stage"
    t.decimal "amount", precision: 10, scale: 2
    t.date "close_date"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_opportunities_on_lead_id"
    t.index ["tenant_id"], name: "index_opportunities_on_tenant_id"
  end

  create_table "payslips", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.date "date"
    t.decimal "gross_salary", precision: 10, scale: 2
    t.decimal "deductions", precision: 10, scale: 2
    t.decimal "net_salary", precision: 10, scale: 2
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payslips_on_employee_id"
    t.index ["tenant_id"], name: "index_payslips_on_tenant_id"
  end

  create_table "pipelines", force: :cascade do |t|
    t.string "name"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_pipelines_on_tenant_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "tax_id"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_suppliers_on_tenant_id"
  end

  create_table "tax_codes", force: :cascade do |t|
    t.string "name"
    t.decimal "rate", precision: 8, scale: 2
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_tax_codes_on_tenant_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "contact"
    t.string "logo"
    t.string "timezone", default: "UTC"
    t.string "currency", default: "USD"
    t.string "language", default: "en"
    t.boolean "multi_uom", default: false
    t.boolean "payroll", default: true
    t.boolean "commissions", default: false
    t.boolean "consignment", default: false
    t.boolean "samples", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
  end

  add_foreign_key "accounts", "tenants"
  add_foreign_key "bill_items", "bills"
  add_foreign_key "bill_items", "items"
  add_foreign_key "bills", "suppliers"
  add_foreign_key "bills", "tenants"
  add_foreign_key "commissions", "invoices"
  add_foreign_key "commissions", "tenants"
  add_foreign_key "commissions", "users"
  add_foreign_key "customers", "tenants"
  add_foreign_key "customers", "users", column: "recruiter_id"
  add_foreign_key "employees", "tenants"
  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "items"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "tenants"
  add_foreign_key "items", "tax_codes"
  add_foreign_key "items", "tenants"
  add_foreign_key "journal_entries", "tenants"
  add_foreign_key "journal_entry_items", "accounts"
  add_foreign_key "journal_entry_items", "journal_entries"
  add_foreign_key "leads", "tenants"
  add_foreign_key "opportunities", "leads"
  add_foreign_key "opportunities", "tenants"
  add_foreign_key "payslips", "employees"
  add_foreign_key "payslips", "tenants"
  add_foreign_key "pipelines", "tenants"
  add_foreign_key "suppliers", "tenants"
  add_foreign_key "tax_codes", "tenants"
  add_foreign_key "users", "tenants"
end
