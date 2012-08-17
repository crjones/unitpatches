require 'sinatra'
require 'rmagick'

get '/:numbers' do
  content_type 'image/png'
  il = ImageList.new
  params[:numbers].each_char do |number|
    il.push(Image.read((number + ".jpg").first))
	end
  img = il.append(true)  
  img.format = 'png'
  img.to_blob
end