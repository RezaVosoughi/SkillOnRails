class User < ApplicationRecord
	has_many :favorites, dependent: :destroy

	has_secure_password
	before_save { self.username = username.downcase }
	
	validates :username,  presence: true,uniqueness: true,length: { maximum: 50 }
	validates :password, presence: true, length: { minimum: 1 }
	
	# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def add_favorite(person_id)
	#puts current_user
	#@favorite = Favorite.new(:current_user.id)
	#@favorite.personId = person_id
 
	#@favorite.save!
   end
end
