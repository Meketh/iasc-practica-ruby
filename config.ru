require 'bundler/setup'

require 'active_support/all'
require 'sinatra'
require 'sinatra/base'

helpers do
  def fib(n)
    return 1 if n == 0
    return 1 if n == 1
    fib(n-1) + fib(n-2)
  end
end

get '/io_bound' do
  File.read('blob.bin')
end

get '/cpu_bound' do
  n = 0
  while n != 50_000_000 do
    
    n+= 1
  end
end

run Sinatra::Application
