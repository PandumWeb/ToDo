class List < ActiveRecord::Base
	has_many :items
	belongs_to :user

	def self.search(search)
	  where("description LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%")
	end
	
end
