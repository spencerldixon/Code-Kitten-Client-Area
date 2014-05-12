class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.text :note
      t.boolean :paid, default: false
      t.references :project

      t.timestamps
    end
  end
end
