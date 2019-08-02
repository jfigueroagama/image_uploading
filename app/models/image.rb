class Image < ApplicationRecord
	has_many_attached :images

	validates :title, presence: true
	validates :location, presence: true
	validate :images_attached

	def thumbnail(input)
		return self.images[input].variant(resize: "300x300!").processed
	end

	private

	def images_attached
		if images.attached? == false
			errors.add(:images, "are missing!")
		end
	end
end
