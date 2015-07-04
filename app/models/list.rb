class List < ActiveRecord::Base
	has_many :items
	validates :title, presence: true
	belongs_to :user

	def self.search(search)
	  where(" title LIKE ?", "%#{search}%")
	end
	
end
