class Subscription < ActiveRecord::Base
  belongs_to :user

  # On create validations
  validates :user, presence: true
  validates :stripe_plan_id, presence: true
  validates :amount, presence: true
  validates :period, presence: true
  
  # On update validations
  validates :stripe_customer_token, presence: true, :on => :update
end
