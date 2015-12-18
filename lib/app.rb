require 'sinatra'
require 'haml'

get '/' do
  status 200
  haml :index
end

get '/fly' do
  status 200
  `curl http://192.168.100.4:8080/api/v1/cli?arch=amd64&platform=linux > /tmp/fly; chmod +x /tmp/fly`
  body `fly`
end

post '/create-pipeline' do
  `./reconfigure #{params['repo-name']} #{params['repo-url']}`
  redirect "http://192.168.100.4:8080/pipelines/#{params['repo-name']}"
end
