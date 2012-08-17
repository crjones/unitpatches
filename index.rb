require 'sinatra'
require 'RMagick'

get '/:numbers' do
  content_type 'image/png'
  il = Magick::ImageList.new
  params[:numbers].each_char do |number|
    il.push(Magick::Image.read((number + ".gif")))
	end
  img = il.append(true)  
  img.format = 'png'
  img.to_blob
end