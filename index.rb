require 'sinatra'

get '/favicon.ico' do
end

get '/:numbers' do
  puts params[:numbers]
end