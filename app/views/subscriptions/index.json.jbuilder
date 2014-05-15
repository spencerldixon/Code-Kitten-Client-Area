json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :stripe_customer_token, :state, :user_id, :stripe_plan_id, :amount, :period
  json.url subscription_url(subscription, format: :json)
end
