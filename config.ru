require 'bundler/setup'

require 'active_support/all'
require 'sinatra'
require 'sinatra/base'

helpers do
  def fact(n)
    return 1 if n == 0
    return 1 if n == 1
    fact(n-1) + fact(n-2)
  end
end

get '/io_bound' do
  File.read('blob.bin')
end

get '/cpu_bound' do
  {result: fact(34)}.to_json
end

run Sinatra::Application
