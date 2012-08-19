require 'sinatra'
require 'RMagick'

get '/favicon.ico' do
end

get '/:numbers' do
  content_type 'image/png'
  il = Magick::ImageList.new
  params[:numbers].each_char do |number|
    il.push(Magick::Image.read("images/" + number + ".gif").first)
	end
  img = il.append(false)  
  img.format = 'png'
  img.to_blob
end