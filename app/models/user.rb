class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :user_name
  validates_uniqueness_of :user_name

  belongs_to :friendship,dependent: :destroy
  belongs_to :inverse_friendship,class: 'friendship' , foreign_key: 'friend_id' ,dependent: :destroy

  def request_friendship(target_user)
  	self.friendships.create(friend: target_user)
  end

  def friend_requests_recieved
  	self.inverse_friendships.where(state:pending)
  end

  def friend_requests_sent
  	self.friendships.where(state:pending)
  end

  def friends
  	self.friendships.where(state:active).map(&:friend)+self.friendships.where(state:active).map(&:user)
  end
end
