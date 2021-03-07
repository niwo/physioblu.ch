#!/usr/bin/env ruby

require "image_processing/mini_magick"

GALLERY_DIR = "source/images/gallery"
THUMBS_DIR = "#{GALLERY_DIR}/thumbs"

Dir.mkdir(THUMBS_DIR) unless Dir.exist?(THUMBS_DIR)


images = Dir.glob("#{GALLERY_DIR}/*.jpg")

# create thumbs & adapt picture size for web
images.each do |image_path|
  puts "Resize original image #{File.basename(image_path)}"

  pipeline = ImageProcessing::MiniMagick.source(image_path)
  pipeline.resize_to_fit(1280, 720).call(destination: image_path)

  puts "Creating thumbnail #{File.basename(image_path)}"
  pipeline.resize_to_fit(200, 200).call(destination: "#{GALLERY_DIR}/thumbs/#{File.basename(image_path)}")
end

# output html help
puts
puts "Use the following markup to referenc all images:"
puts "-" * 60 
images.each do |image_path|
  gallery_url = GALLERY_DIR.gsub(/^source/, "")
  puts <<~HEREDOC
<a href="#{gallery_url}/#{File.basename(image_path)}">
  <img src="#{gallery_url}/thumbs/#{File.basename(image_path)}">
</a>
HEREDOC
end
puts "-" * 60