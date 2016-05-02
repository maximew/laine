class Door < ActiveRecord::Base
	belongs_to :category

	has_attached_file :image, 
	styles: { 
		medium: "320",
		:small => "250x200#"
	}, 
	default_url: "/images/:style/missing.png"

  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end