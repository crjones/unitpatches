require 'sinatra'
require 'RMagick'

helpers do  
  include Rack::Utils  
  alias_method :h, :escape_html  
end  
  
get '/' do  
  erb :index  
end  
  
post '/' do  
  if params[:number] and not params[:number].empty?  
    @number = params[:number]  
  end  
  erb :index  
end

get '/favicon.ico' do
end

get '/:number' do
  content_type 'image/png'
  il = Magick::ImageList.new
  params[:number].each_char do |number|
    il.push(Magick::Image.read("images/" + number + ".gif").first)
	end
  img = il.append(false)  
  img.format = 'png'
  img.to_blob
end