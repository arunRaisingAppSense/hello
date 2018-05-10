class Photo < ApplicationRecord
	has_attached_file :image, :styles => { :thumb=> "200x130#" }, :whiny_thumbnails => false
	#This validates the type of file uploaded. According to this, only images are allowed.
  	#validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	do_not_validate_attachment_file_type :image


  	#Validates file, file type and file size
  	validates_attachment :image, presence: true,
  	content_type: { content_type: "image/jpeg" },
  	size: { in: 0..1.megabytes }
end
