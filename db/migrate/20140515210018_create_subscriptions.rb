class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :stripe_customer_token
      t.string :state
      t.references :user, index: true
      t.string :stripe_plan_id
      t.decimal :amount
      t.string :period

      t.timestamps
    end
  end
end
