json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :amount, :note, :paid, :project
  json.url invoice_url(invoice, format: :json)
end
