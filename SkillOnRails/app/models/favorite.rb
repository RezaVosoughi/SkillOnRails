class Favorite < ApplicationRecord
	belongs_to :user
	
	validates :personId, presence: true, uniqueness: { scope: :user_id }
end
