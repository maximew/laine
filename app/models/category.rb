class Category < ActiveRecord::Base
	has_many :door, dependent: :restrict_with_error
	has_many :garage, dependent: :restrict_with_error
	has_many :portal, dependent: :restrict_with_error
	has_many :shutter, dependent: :restrict_with_error
	has_many :store, dependent: :restrict_with_error
	has_many :window, dependent: :restrict_with_error

	def to_label
		"#{libelle}"
	end
end
