require 'sinatra'
require 'haml'

get '/' do
  status 200
  haml :index
end

get '/status' do
  status 200
  haml :status
end

post '/create-pipeline' do
  `./reconfigure #{params['repo-name']} #{params['repo-url']}`
  redirect "/status?pipeline=#{params['repo-name']}"
end
