require 'sinatra'
require 'RMagick'

get '/:numbers' do
  content_type 'image/png'
  il = ImageList.new
  params[:numbers].each_char do |number|
    il.push(Image.read((number + ".gif").first))
	end
  img = il.append(true)  
  img.format = 'png'
  img.to_blob
end