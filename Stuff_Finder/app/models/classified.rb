class Classified < ActiveRecord::Base

	belongs_to :category
	belongs_to :user

	validates :title, :description, :price, :category, presence: true

	def self.search_for(query)
		where("title LIKE :query or description LIKE :query", query: "%#{query}%")
	end

end
