class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :user_name
  validates_uniqueness_of :user_name

  has_many :friendships,dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship' , foreign_key: 'friend_id' ,dependent: :destroy

  def request_friendship(target_user)
  	self.friendships.create(friend: target_user)
  end

  def friend_requests_recieved
  	self.inverse_friendships.where(state: "pending")
  end

  def friend_requests_sent
  	self.friendships.where(state: "pending")
  end

  def active_friends
  	self.friendships.where(state: "active").map(&:friend)+self.inverse_friendships.where(state: "active").map(&:user)
  end

  def friendship_status(target_user)
  	find_friendship = Friendship.where(user_id: [self.id,target_user.id],friend_id: [self.id,target_user.id]).first
	unless find_friendship
		return 'not_friends'
	else 
		if find_friendship.state == "active"
			return find_friendship.state
		else
			if find_friendship.user == self
				return 'pending'
			else
				return 'requested'
			end
		end
	end			
  end
end
