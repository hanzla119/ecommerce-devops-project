require 'sinatra'
require 'json'

# Configure the app to listen on all network interfaces
set :bind, '0.0.0.0'
set :port, 4567

post '/api/payment' do
  content_type :json
  
  # Simulate processing a payment
  sleep(1) # simulate a slight delay
  
  {
    status: 'success',
    message: 'Payment processed successfully',
    transaction_id: "TXN-#{rand(1000..9999)}"
  }.to_json
end

get '/health' do
  content_type :json
  { status: 'Payment Service is healthy!' }.to_json
end
