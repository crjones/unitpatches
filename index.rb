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

get '/:style/:number.:format' do
  content_type 'image/png'
  il = Magick::ImageList.new
  params[:number].each_char do |number|
    il.push(Magick::Image.read("images/" + params[:style] + "/" + number + ".png").first)
	end
  img = il.append(false)  
  img.format = 'png'
  img.to_blob
end

get '/:number.:format' do
  content_type 'image/png'
  il = Magick::ImageList.new
  puts params[:number]
  puts params[:format]
  params[:number].each_char do |number|
    il.push(Magick::Image.read("images/red/" + number + ".png").first)
	end
  img = il.append(false)  
  img.format = 'png'
  img.to_blob
end